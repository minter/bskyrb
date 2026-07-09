require "uri"
require_relative "../atproto/requests"
require "xrpc"
require "nokogiri"
require "tempfile"
require "mini_mime"
require "addressable/uri"
require "mini_magick"
require "public_suffix"
require "streamio-ffmpeg"

module Bskyrb
  module PostTools
    IMAGE_EMBED_MAX_IMAGES = 4
    GALLERY_EMBED_MAX_ITEMS = 10
    DEFAULT_IMAGE_ASPECT_RATIO = {"width" => 1, "height" => 1}.freeze
    MENTION_PATTERN = /(^|\s|\()(@)([a-zA-Z0-9.-]+)(\b)/
    URL_PATTERN = /(^|\s|\()((https?:\/\/\S+)|(([a-z][a-z0-9]*(\.[a-z0-9]+)+)\S*))/i
    TRAILING_PUNCTUATION_PATTERN = /\p{P}+$/u
    ZERO_WIDTH_TAG_CHARS = "\u00AD\u2060\u200A\u200B\u200C\u200D\u20e2"
    TAG_PATTERN = /(^|\s)([#＃])((?!\ufe0f)[^\s#{ZERO_WIDTH_TAG_CHARS}]*[^\d\s\p{P}#{ZERO_WIDTH_TAG_CHARS}]+[^\s#{ZERO_WIDTH_TAG_CHARS}]*)?/u
    CASHTAG_PATTERN = /(^|\s|\()\$([A-Za-z][A-Za-z0-9]{0,4})(?=\s|$|[.,;:!?)"'\u2019])/u
    NON_LINK_TLDS = %w[avif gif jpeg jpg png svg webp].freeze

    # Check if two facets have overlapping byte ranges
    def facets_overlap?(facet1, facet2)
      start1 = facet1["index"]["byteStart"]
      end1 = facet1["index"]["byteEnd"]
      start2 = facet2["index"]["byteStart"]
      end2 = facet2["index"]["byteEnd"]

      # Check if ranges overlap
      start1 < end2 && start2 < end1
    end

    # Check if a facet conflicts with any in a list of facets
    def has_conflict?(facet, facet_list)
      facet_list.any? { |existing_facet| facets_overlap?(facet, existing_facet) }
    end

    def create_facets(text, manual_facets: [])
      # Start with manual facets (they take priority)
      facets = manual_facets.dup

      # Add automatic facets that don't conflict with manual ones
      automatic_facets = find_automatic_facets(text)
      non_conflicting_auto_facets = automatic_facets.reject do |auto_facet|
        has_conflict?(auto_facet, facets)
      end

      facets.concat(non_conflicting_auto_facets)

      # Sort by byte position and validate
      facets.sort_by! { |f| f["index"]["byteStart"] }
      validate_facets(facets)
    end

    # Extract the original automatic facet detection logic
    def find_automatic_facets(text)
      facets = []

      find_mentions(text, facets)
      find_links(text, facets)
      find_hashtags(text, facets)
      find_cashtags(text, facets)

      facets
    end

    def trim_trailing_link_punctuation(link_text)
      trim_link_text(link_text).first
    end

    # Validate facets structure and content
    def validate_facets(facets)
      facets.select do |facet|
        next false unless facet["features"].is_a?(Array) && !facet["features"].empty?

        # Validate each feature in the facet
        facet["features"].all? do |feature|
          case feature["$type"]
          when "app.bsky.richtext.facet#mention"
            feature["did"].is_a?(String) && !feature["did"].empty?
          when "app.bsky.richtext.facet#link"
            feature["uri"].is_a?(String) && !feature["uri"].empty? &&
              feature["uri"].start_with?("http://", "https://")
          when "app.bsky.richtext.facet#tag"
            feature["tag"].is_a?(String) && !feature["tag"].empty?
          else
            false # Unknown feature type
          end
        end
      end
    end

    # Helper method to create a manual link facet
    def create_link_facet(text, link_text, url, start_pos = nil)
      if start_pos.nil?
        # Auto-find the position of link_text in the full text
        start_pos = text.index(link_text)
        return nil if start_pos.nil?
      end

      byte_start = text[0...start_pos].bytesize
      byte_end = text[0...(start_pos + link_text.length)].bytesize

      {
        "$type" => "app.bsky.richtext.facet",
        "index" => {
          "byteStart" => byte_start,
          "byteEnd" => byte_end
        },
        "features" => [
          {
            "uri" => url,
            "$type" => "app.bsky.richtext.facet#link"
          }
        ]
      }
    end

    # Helper method to create a manual hashtag facet
    def create_hashtag_facet(text, hashtag_text, tag, start_pos = nil)
      if start_pos.nil?
        # Auto-find the position of hashtag_text in the full text
        start_pos = text.index(hashtag_text)
        return nil if start_pos.nil?
      end

      byte_start = text[0...start_pos].bytesize
      byte_end = text[0...(start_pos + hashtag_text.length)].bytesize

      {
        "$type" => "app.bsky.richtext.facet",
        "index" => {
          "byteStart" => byte_start,
          "byteEnd" => byte_end
        },
        "features" => [
          {
            "tag" => tag,
            "$type" => "app.bsky.richtext.facet#tag"
          }
        ]
      }
    end

    # Helper method to create a manual mention facet
    def create_mention_facet(text, mention_text, did, start_pos = nil)
      if start_pos.nil?
        # Auto-find the position of mention_text in the full text
        start_pos = text.index(mention_text)
        return nil if start_pos.nil?
      end

      byte_start = text[0...start_pos].bytesize
      byte_end = text[0...(start_pos + mention_text.length)].bytesize

      {
        "$type" => "app.bsky.richtext.facet",
        "index" => {
          "byteStart" => byte_start,
          "byteEnd" => byte_end
        },
        "features" => [
          {
            "did" => did,
            "$type" => "app.bsky.richtext.facet#mention"
          }
        ]
      }
    end

    private

    def find_mentions(text, facets)
      text.scan(MENTION_PATTERN) do
        match_data = Regexp.last_match
        handle = match_data[3]
        next unless valid_facet_domain?(handle) || handle.end_with?(".test")

        did = resolve_mention_did(handle)
        next if did.nil? || did.empty?

        index_start = text[0...match_data.begin(2)].bytesize
        index_end = text[0...match_data.end(3)].bytesize
        facet = mention_facet(index_start, index_end, did)
        facets << facet unless has_conflict?(facet, facets)
      end
    end

    def find_links(text, facets)
      text.scan(URL_PATTERN) do
        match_data = Regexp.last_match
        link_text = match_data[2]
        uri = link_text.dup

        unless uri.start_with?("http://", "https://")
          domain = match_data[5]
          next unless domain && valid_facet_domain?(domain)
          uri = "https://#{uri}"
        end

        trimmed_uri, trimmed_chars = trim_link_text(uri)
        trimmed_link_text = link_text[0...(link_text.length - trimmed_chars)]
        next if trimmed_link_text.nil? || trimmed_link_text.empty?

        index_start = text[0...match_data.begin(2)].bytesize
        index_end = index_start + trimmed_link_text.bytesize
        facet = link_facet(index_start, index_end, trimmed_uri)
        facets << facet unless has_conflict?(facet, facets)
      end
    end

    def find_hashtags(text, facets)
      text.scan(TAG_PATTERN) do
        match_data = Regexp.last_match
        tag = match_data[3]
        next if tag.nil?

        tag = tag.strip.sub(TRAILING_PUNCTUATION_PATTERN, "")
        next if tag.empty?
        next if tag.length > 64 && tag.grapheme_clusters.length > 64

        marker = match_data[2]
        index_start = text[0...match_data.begin(2)].bytesize
        index_end = index_start + marker.bytesize + tag.bytesize
        facet = tag_facet(index_start, index_end, tag)
        facets << facet unless has_conflict?(facet, facets)
      end
    end

    def find_cashtags(text, facets)
      text.scan(CASHTAG_PATTERN) do
        match_data = Regexp.last_match
        ticker = match_data[2]
        next if ticker.nil? || ticker.empty?

        tag = "$#{ticker.upcase}"
        index_start = text[0...match_data.begin(0)].bytesize + match_data[1].bytesize
        index_end = index_start + 1 + ticker.bytesize
        facet = tag_facet(index_start, index_end, tag)
        facets << facet unless has_conflict?(facet, facets)
      end
    end

    def resolve_mention_did(handle)
      resolve_handle(@pds, handle)&.dig("did")
    rescue
      nil
    end

    def trim_link_text(uri)
      trimmed = uri.dup
      trimmed_chars = 0

      if trimmed.match?(/[.,;:!?]\z/)
        trimmed = trimmed[0...-1]
        trimmed_chars += 1
      end

      if trimmed.end_with?(")") && !trimmed.include?("(")
        trimmed = trimmed[0...-1]
        trimmed_chars += 1
      end

      [trimmed, trimmed_chars]
    end

    def valid_facet_domain?(domain)
      normalized = domain.to_s.downcase
      return false unless normalized.match?(/\A[a-z0-9](?:[a-z0-9-]*[a-z0-9])?(?:\.[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)+\z/)
      tld = normalized.split(".").last
      return false if tld.length < 2 || NON_LINK_TLDS.include?(tld)

      PublicSuffix.valid?(normalized)
    rescue PublicSuffix::Error
      false
    end

    def mention_facet(byte_start, byte_end, did)
      {
        "$type" => "app.bsky.richtext.facet",
        "index" => {
          "byteStart" => byte_start,
          "byteEnd" => byte_end
        },
        "features" => [
          {
            "did" => did,
            "$type" => "app.bsky.richtext.facet#mention"
          }
        ]
      }
    end

    def link_facet(byte_start, byte_end, uri)
      {
        "$type" => "app.bsky.richtext.facet",
        "index" => {
          "byteStart" => byte_start,
          "byteEnd" => byte_end
        },
        "features" => [
          {
            "uri" => uri,
            "$type" => "app.bsky.richtext.facet#link"
          }
        ]
      }
    end

    def tag_facet(byte_start, byte_end, tag)
      {
        "$type" => "app.bsky.richtext.facet",
        "index" => {
          "byteStart" => byte_start,
          "byteEnd" => byte_end
        },
        "features" => [
          {
            "tag" => tag,
            "$type" => "app.bsky.richtext.facet#tag"
          }
        ]
      }
    end

    def create_external_embed(embed_url, client)
      response = HTTParty.get(embed_url)
      doc = Nokogiri::HTML.parse(response.body)
      og_data = {
        title: nil,
        description: nil,
        image: nil
      }

      doc.css("meta[property^='og:']").each do |meta|
        case meta["property"]
        when "og:title"
          og_data[:title] = meta["content"]
        when "og:description"
          og_data[:description] = meta["content"]
        when "og:image"
          og_data[:image] = meta["content"]
        end
      end

      embed_data = {
        "$type" => "app.bsky.embed.external",
        "external" => {
          "uri" => embed_url,
          "title" => og_data[:title] || "",
          "description" => og_data[:description] || ""
        }
      }
      embed_data["external"]["thumb"] = get_image_blob(og_data[:image], client) if og_data[:image]
      embed_data
    end

    def create_image_embed(embed_images, client)
      images = []

      normalize_embed_images(embed_images).first(GALLERY_EMBED_MAX_ITEMS).each do |image|
        image_item = build_image_embed_item(image, client)
        images << image_item if image_item&.dig("image")
      end

      return nil if images.empty?

      if images.length <= IMAGE_EMBED_MAX_IMAGES
        return {
          "$type" => "app.bsky.embed.images",
          "images" => images
        }
      end

      {
        "$type" => "app.bsky.embed.gallery",
        "items" => images.map { |image| gallery_image_item(image) }
      }
    end

    def normalize_embed_images(embed_images)
      return [] if embed_images.nil?
      return [embed_images] if embed_images.is_a?(String) || embed_images.is_a?(File) || embed_images.is_a?(Tempfile)

      embed_images
    end

    def build_image_embed_item(image, client)
      image_source = image
      alt_text = ""

      if image.is_a?(Hash)
        image_source = image["url"]
        alt_text = image["alt"] || ""
      end

      upload_metadata = get_image_upload_metadata(image_source, client)
      return nil unless upload_metadata&.dig("image")

      {
        "alt" => alt_text,
        "image" => upload_metadata["image"],
        "aspectRatio" => upload_metadata["aspectRatio"]
      }
    end

    def gallery_image_item(image)
      image.merge(
        "$type" => "app.bsky.embed.gallery#image",
        "aspectRatio" => image["aspectRatio"] || DEFAULT_IMAGE_ASPECT_RATIO.dup
      )
    end

    def create_video_embed(embed_video_file_path, client)
      data = upload_video(embed_video_file_path, client)
      {
        "$type" => "app.bsky.embed.video",
        "video" => data,
        "aspectRatio" => get_video_aspect_ratio(embed_video_file_path)
      }
    end

    def get_image_blob(image, client)
      upload_metadata = get_image_upload_metadata(image, client)
      upload_metadata && upload_metadata["image"]
    end

    def get_image_upload_metadata(image, client)
      case image
      when String
        if image.start_with?("http://", "https://")
          uri = Addressable::URI.parse(image).normalize
          download_and_upload_image_with_metadata(uri, client)
        else
          File.open(image) { |file| upload_image_with_metadata(file, client) }
        end
      when File, Tempfile
        upload_image_with_metadata(image, client)
      else
        raise ArgumentError, "Invalid image type. Expected String (URL) or File object."
      end
    end

    def download_and_upload_image(uri, client)
      upload_metadata = download_and_upload_image_with_metadata(uri, client)
      upload_metadata && upload_metadata["image"]
    end

    def download_and_upload_image_with_metadata(uri, client)
      tempfile = Tempfile.new(["thumb", File.extname(uri.path)])
      begin
        # Download the file
        Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
          request = Net::HTTP::Get.new(uri.to_s)
          http.request request do |response|
            File.open(tempfile.path, "wb") do |io|
              response.read_body do |chunk|
                io.write chunk
              end
            end
          end
        end
        upload_image_with_metadata(tempfile, client)
      rescue => e
        Bskyrb.logger.error("Error downloading image: #{e.message}")
        nil
      ensure
        tempfile.close
        tempfile.unlink
      end
    end

    def upload_image_with_metadata(file, client)
      image = upload_image(file, client)
      return nil unless image

      {
        "image" => image,
        "aspectRatio" => get_image_aspect_ratio(file.path)
      }
    end

    def upload_image(file, client)
      content_type = MiniMime.lookup_by_filename(file.path)&.content_type || "application/octet-stream"

      # Bluesky image limits: 2MB per image and 4000x4000 pixels.
      # Target slightly under the byte limit to leave a safety buffer.
      max_size = 1950 * 1024 # ~1.95MB in bytes
      max_dimension = 4000
      file_path = file.path

      unless image_within_limits?(file_path, max_size, max_dimension)
        Bskyrb.logger.debug("Image (#{File.size(file_path)} bytes) exceeds size or dimension limit, compressing...")
        compressed_file = compress_image(file_path, max_size, max_dimension)
        file_path = compressed_file.path if compressed_file
      end

      begin
        upload_response = client.upload_blob(file_path, content_type)
        return nil unless upload_response&.dig("blob")
        {
          "$type" => "blob",
          "ref" => upload_response["blob"]["ref"],
          "mimeType" => upload_response["blob"]["mimeType"],
          "size" => upload_response["blob"]["size"]
        }
      rescue => e
        Bskyrb.logger.error("Error uploading image: #{e.message}")
        nil
      ensure
        # Clean up compressed temp file if we created one
        if compressed_file && compressed_file != file
          compressed_file.close
          compressed_file.unlink
        end
      end
    end

    def get_image_aspect_ratio(file_path)
      image = MiniMagick::Image.open(file_path)
      {
        "width" => image.width,
        "height" => image.height
      }
    rescue => e
      Bskyrb.logger.debug("Could not inspect image aspect ratio: #{e.message}")
      DEFAULT_IMAGE_ASPECT_RATIO.dup
    end

    def image_within_limits?(file_path, max_size, max_dimension)
      return false if File.size(file_path) > max_size

      image = MiniMagick::Image.open(file_path)
      image.width <= max_dimension && image.height <= max_dimension
    rescue => e
      # If we can't inspect the image (e.g. ImageMagick unavailable), let the
      # upload proceed and rely on the server to validate.
      Bskyrb.logger.debug("Could not inspect image dimensions: #{e.message}")
      true
    end

    def compress_image(file_path, max_size, max_dimension = 4000)
      # Create a temporary file for the compressed image
      temp_file = Tempfile.new(["compressed", File.extname(file_path)])

      # Start with high quality and reduce if needed
      quality = 85

      # Try different quality levels until we get under the size limit.
      # Each pass also constrains dimensions to max_dimension (the trailing
      # ">" only shrinks images larger than the box, preserving aspect ratio).
      loop do
        image = MiniMagick::Image.open(file_path)
        image.resize "#{max_dimension}x#{max_dimension}>"
        image.format "jpeg" # Convert to JPEG for better compression
        image.quality quality.to_s
        image.write temp_file.path

        current_size = File.size(temp_file.path)
        Bskyrb.logger.debug("Compressed image size: #{current_size} bytes (quality: #{quality})")

        # If we're under the limit or quality is too low, break
        break if current_size <= max_size || quality <= 20

        # Reduce quality for next iteration
        quality -= 15
      end

      # If still too large, try resizing
      if File.size(temp_file.path) > max_size
        Bskyrb.logger.debug("Still too large after quality reduction, trying resize...")
        image = MiniMagick::Image.open(file_path)

        # Resize to 80% of the dimension-capped size and try again
        original_width = [image.width, max_dimension].min
        original_height = [image.height, max_dimension].min
        new_width = (original_width * 0.8).to_i
        new_height = (original_height * 0.8).to_i

        image.resize "#{new_width}x#{new_height}"
        image.format "jpeg"
        image.quality "75"
        image.write temp_file.path

        Bskyrb.logger.debug("Resized image size: #{File.size(temp_file.path)} bytes")
      end

      temp_file
    rescue => e
      Bskyrb.logger.error("Error compressing image: #{e.message}")
      temp_file&.close
      temp_file&.unlink
      nil
    end

    def upload_video(file_path, client)
      content_type = MiniMime.lookup_by_filename(file_path)&.content_type || "application/octet-stream"
      content_type = "video/mp4" if content_type == "application/mp4"
      client.upload_video_blob(file_path, content_type)
    end

    def get_video_aspect_ratio(file_path)
      video = FFMPEG::Movie.new(file_path)
      {
        "width" => video.width,
        "height" => video.height
      }
    end
  end
end

module Bskyrb
  class PostRecord
    include ATProto::RequestUtils
    include PostTools

    attr_accessor :text, :timestamp, :facets, :embed, :pds

    def initialize(text, timestamp: DateTime.now.iso8601(3), pds: "https://bsky.social")
      @text = text
      @timestamp = timestamp
      @pds = pds
    end

    def to_json_hash
      {
        text: @text,
        createdAt: @timestamp,
        "$type": "app.bsky.feed.post",
        facets: @facets
      }
    end

    def create_facets!
      @facets = create_facets(@text)
    end
  end
end
