require "uri"
require "ipaddr"
require "net/http"
require "socket"
require_relative "../atproto/requests"
require "xrpc"
require "nokogiri"
require "tempfile"
require "mini_mime"
require "addressable/uri"
require "mini_magick"
require "public_suffix"

# public_suffix (through at least 7.0.5) reads its suffix list with the process
# locale's encoding, raising Encoding::CompatibilityError under C/POSIX locales
# (common for cron jobs and containers). Preload the list as UTF-8 instead.
# Upstream fix: https://github.com/weppos/publicsuffix-ruby/issues/118
PublicSuffix::List.default = PublicSuffix::List.parse(
  File.read(PublicSuffix::List::DEFAULT_LIST_PATH, encoding: Encoding::UTF_8)
)
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
    REMOTE_REDIRECT_LIMIT = 5
    REMOTE_PAGE_CONTENT_TYPES = %w[text/html application/xhtml+xml].freeze
    REMOTE_IMAGE_CONTENT_TYPES = ["image/"].freeze
    BLOCKED_REMOTE_NETWORKS = %w[
      0.0.0.0/8
      10.0.0.0/8
      100.64.0.0/10
      127.0.0.0/8
      169.254.0.0/16
      172.16.0.0/12
      192.0.0.0/24
      192.0.2.0/24
      192.88.99.0/24
      192.168.0.0/16
      198.18.0.0/15
      198.51.100.0/24
      203.0.113.0/24
      224.0.0.0/4
      240.0.0.0/4
      ::/96
      ::ffff:0:0/96
      64:ff9b::/96
      64:ff9b:1::/48
      100::/64
      2001::/32
      2001:2::/48
      2001:10::/28
      2001:20::/28
      2001:db8::/32
      2002::/16
      3fff::/20
      5f00::/16
      fc00::/7
      fe80::/10
      fec0::/10
      ff00::/8
    ].map { |network| IPAddr.new(network) }.freeze

    class RemoteFetchError < ArgumentError
    end

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

    def normalize_remote_uri(value)
      uri = URI.parse(value.to_s).normalize
      unless uri.is_a?(URI::HTTP) && uri.absolute? && uri.hostname && !uri.hostname.empty?
        raise RemoteFetchError, "Remote URL must be an absolute HTTP(S) URL"
      end
      raise RemoteFetchError, "Remote URL must not include credentials" if uri.userinfo
      raise RemoteFetchError, "Remote URL must not include an IPv6 zone identifier" if uri.hostname.include?("%")

      uri
    rescue URI::InvalidURIError => e
      raise RemoteFetchError, "Invalid remote URL: #{e.message}"
    end

    def resolve_remote_addresses(host, port)
      Addrinfo.getaddrinfo(host, port, nil, :STREAM).map(&:ip_address).uniq
    rescue SocketError => e
      raise RemoteFetchError, "Could not resolve remote host: #{e.message}"
    end

    def public_remote_address(uri)
      addresses = resolve_remote_addresses(uri.hostname, uri.port)
      raise RemoteFetchError, "Remote host did not resolve to an address" if addresses.empty?

      parsed_addresses = addresses.map { |address| IPAddr.new(address) }
      if parsed_addresses.any? { |address| blocked_remote_address?(address) }
        raise RemoteFetchError, "Remote host resolves to a non-public address"
      end

      addresses.first
    rescue IPAddr::InvalidAddressError => e
      raise RemoteFetchError, "Remote host resolved to an invalid address: #{e.message}"
    end

    def blocked_remote_address?(address)
      BLOCKED_REMOTE_NETWORKS.any? do |network|
        network.ipv4? == address.ipv4? && network.include?(address)
      end
    end

    def remote_http(uri, address)
      http = Net::HTTP.new(uri.hostname, uri.port, nil)
      http.ipaddr = address
      http.use_ssl = uri.scheme == "https"
      http
    end

    def validate_remote_content_type!(response, expected_content_types)
      content_type = response["content-type"].to_s.split(";", 2).first.strip.downcase
      accepted = expected_content_types.any? do |expected|
        expected.end_with?("/") ? content_type.start_with?(expected) : content_type == expected
      end
      return if accepted

      raise RemoteFetchError, "Remote response has an unsupported content type"
    end

    def fetch_remote_resource(value, expected_content_types:, redirects_remaining: REMOTE_REDIRECT_LIMIT)
      uri = normalize_remote_uri(value)

      loop do
        address = public_remote_address(uri)
        redirect_location = nil
        result = nil

        remote_http(uri, address).start do |http|
          request = Net::HTTP::Get.new(uri.request_uri)
          http.request(request) do |response|
            case response
            when Net::HTTPSuccess
              validate_remote_content_type!(response, expected_content_types)
              result = yield response, uri
            when Net::HTTPRedirection
              redirect_location = response["location"]
              if redirect_location.nil? || redirect_location.strip.empty?
                raise RemoteFetchError, "Remote redirect is missing a location"
              end
            else
              raise RemoteFetchError, "Remote request returned HTTP #{response.code}"
            end
          end
        end

        return result unless redirect_location
        raise RemoteFetchError, "Too many remote redirects" if redirects_remaining.zero?

        redirects_remaining -= 1
        redirect_url = Addressable::URI.join(uri.to_s, redirect_location.strip).normalize.to_s
        uri = normalize_remote_uri(redirect_url)
      end
    end

    def create_external_embed(embed_url, client)
      requested_uri = normalize_remote_uri(embed_url)
      page_body, page_uri = fetch_remote_resource(
        requested_uri,
        expected_content_types: REMOTE_PAGE_CONTENT_TYPES
      ) do |response, final_uri|
        [response.body, final_uri]
      end
      doc = Nokogiri::HTML.parse(page_body)
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
          "uri" => requested_uri.to_s,
          "title" => og_data[:title] || "",
          "description" => og_data[:description] || ""
        }
      }
      thumb = external_thumb_blob(page_uri, og_data[:image], client)
      embed_data["external"]["thumb"] = thumb if thumb
      embed_data
    end

    # og:image is often a relative path (piped.video serves "/img/icons/..."),
    # which get_image_blob would otherwise treat as a local file. Resolve it
    # against the page URL, and never let a bad thumbnail sink the whole post.
    def external_thumb_blob(page_url, og_image, client)
      return nil if og_image.nil? || og_image.strip.empty?

      image_uri = normalize_remote_uri(Addressable::URI.join(page_url.to_s, og_image.strip).normalize.to_s)
      upload_metadata = download_and_upload_image_with_metadata(image_uri, client)
      upload_metadata && upload_metadata["image"]
    rescue => e
      Bskyrb.logger.warn("Skipping external embed thumbnail #{og_image.inspect} for #{page_url}: #{e.message}")
      nil
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
      uri = normalize_remote_uri(uri)
      tempfile = Tempfile.new(["thumb", File.extname(uri.path)])
      begin
        fetch_remote_resource(uri, expected_content_types: REMOTE_IMAGE_CONTENT_TYPES) do |response, _final_uri|
          File.open(tempfile.path, "wb") do |io|
            response.read_body do |chunk|
              io.write chunk
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
