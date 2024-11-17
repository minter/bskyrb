require "uri"
require_relative "../atproto/requests"
require "xrpc"
require "nokogiri"
require "tempfile"
require "mini_mime"
require "addressable/uri"
# module Bskyrb
#   include Atmosfire

#   class Client
#     include RequestUtils
#     attr_reader :session

#     def initialize(session)
#       @session = session
#     end
#   end
# end

module Bskyrb
  module PostTools
    def create_facets(text)
      facets = []

      # Regex patterns
      mention_pattern = /(^|\s|\()(@)([a-zA-Z0-9.-]+)(\b)/
      link_pattern = URI::DEFAULT_PARSER.make_regexp(%w[http https])
      hashtag_pattern = /(?<![\w#])(#)(?!\d+\b)([a-zA-Z0-9_]+)(?!\w)/

      # Find mentions
      text.enum_for(:scan, mention_pattern).each do |m|
        index_start = text[0...Regexp.last_match.begin(0)].bytesize
        index_end = text[0...Regexp.last_match.end(0)].bytesize
        did = resolve_handle(@pds, m.join("").strip[1..-1])["did"]
        unless did.nil?
          facets.push(
            "$type" => "app.bsky.richtext.facet",
            "index" => {
              "byteStart" => index_start,
              "byteEnd" => index_end
            },
            "features" => [
              {
                "did" => did, # this is the matched mention
                "$type" => "app.bsky.richtext.facet#mention"
              }
            ]
          )
        end
      end

      # Find links
      text.scan(link_pattern) do |match|
        next if match.nil? || match.empty?
        full_match = match.join
        index_start = text.index(full_match).to_s.bytesize
        index_end = (index_start + full_match.bytesize)

        begin
          uri = URI.parse(full_match)
          normalized_uri = uri.normalize.to_s
          facets.push(
            "$type" => "app.bsky.richtext.facet",
            "index" => {
              "byteStart" => index_start,
              "byteEnd" => index_end
            },
            "features" => [
              {
                "uri" => normalized_uri,
                "$type" => "app.bsky.richtext.facet#link"
              }
            ]
          )
        rescue URI::InvalidURIError
          # Silently skip invalid URIs
        end
      end

      # Find hashtags
      text.enum_for(:scan, hashtag_pattern).each do |m|
        index_start = text[0...Regexp.last_match.begin(0)].bytesize
        index_end = text[0...Regexp.last_match.end(0)].bytesize
        tag = m[1] # The hashtag content is now in the second capture group
        facets.push(
          "$type" => "app.bsky.richtext.facet",
          "index" => {
            "byteStart" => index_start,
            "byteEnd" => index_end
          },
          "features" => [
            {
              "tag" => tag.gsub(/^#/, ""), # Remove the leading '#' from the hashtag
              "$type" => "app.bsky.richtext.facet#tag"
            }
          ]
        )
      end

      facets  # Always return the array, even if it's empty
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
      # Limited to a maximum of 4 images
      images = []
      embed_images = [embed_images] if embed_images.is_a?(String)
      embed_images[0..3].each do |image|
        # Get blob data for the image
        blob = if image.is_a?(Hash)
          # If image has alt text, it will be in the format: { "url" => "...", "alt" => "..." }
          alt_text = image["alt"] || ""
          {
            "alt" => alt_text,
            "image" => get_image_blob(image["url"], client)
          }
        else
          # If just a string/file is passed, use empty alt text
          {
            "alt" => "",
            "image" => get_image_blob(image, client)
          }
        end
        images << blob if blob["image"] # Only add if blob was successfully created
      end

      return nil if images.empty?
      # Return the properly formatted embed data
      {
        "$type" => "app.bsky.embed.images",
        "images" => images
      }
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
      case image
      when String
        if image.start_with?("http://", "https://")
          uri = Addressable::URI.parse(image).normalize
          download_and_upload_image(uri, client)
        else
          upload_image(File.open(image), client)
        end
      when File, Tempfile
        upload_image(image, client)
      else
        raise ArgumentError, "Invalid image type. Expected String (URL) or File object."
      end
    end

    def download_and_upload_image(uri, client)
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
        upload_image(tempfile, client)
      rescue => e
        puts "Error downloading image: #{e.message}"
        nil
      ensure
        tempfile.close
        tempfile.unlink
      end
    end

    def upload_image(file, client)
      content_type = MiniMime.lookup_by_filename(file.path)&.content_type || "application/octet-stream"
      begin
        upload_response = client.upload_blob(file.path, content_type)
        {
          "$type" => "blob",
          "ref" => upload_response["blob"]["ref"],
          "mimeType" => upload_response["blob"]["mimeType"],
          "size" => upload_response["blob"]["size"]
        }
      rescue => e
        puts "Error uploading image: #{e.message}"
        nil
      end
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
