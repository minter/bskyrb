# typed: true

require "bskyrb/post_tools"
require "mini_magick"

module Bskyrb
  class Client
    include ATProto::RequestUtils
    include PostTools

    attr_reader :session

    # Job state constants for video processing
    JOB_STATE_COMPLETED = "JOB_STATE_COMPLETED"
    JOB_STATE_FAILED = "JOB_STATE_FAILED"

    def initialize(session)
      @session = session
      @pds = session.credentials.pds
      @img_compression = ENV.fetch("BSKYRB_IMG_COMPRESSION", "100")
    end

    def create_record(input)
      HTTParty.post(
        create_record_uri(session.pds),
        body: input.to_json,
        headers: default_authenticated_headers(session)
      )
    end

    def get_post_by_url(url, depth = 10)
      at_uri = at_post_link(session.pds, url)
      query = Bskyrb::AppBskyFeedGetpostthread::GetPostThread::Input.new.tap do |q|
        q.uri = at_uri
        q.depth = depth
      end

      full_uri = get_post_thread_uri(session.pds, query)

      res = HTTParty.get(
        full_uri,
        headers: default_authenticated_headers(session)
      )

      if res.success?
        if res["thread"] && res["thread"]["post"]
          Bskyrb::AppBskyFeedDefs::PostView.from_hash res["thread"]["post"]
        else
          raise "Unexpected response structure: 'thread' or 'post' key missing"
        end
      else
        raise "API request failed: #{res.code} - #{res.message}"
      end
    rescue
      nil
    end

    def upload_blob(blob_path, content_type)
      if content_type.include?("image")
        # only images
        # https://github.com/bluesky-social/atproto/blob/72a5265e05d8eec4f10acdae8f6dfee409ea820a/lexicons/app/bsky/embed/images.json#L24
        max_size = 999 * 1024  # 999KB in bytes
        file_size = File.size(blob_path)

        if file_size > max_size
          # Reduce the image size using MiniMagick
          image = MiniMagick::Image.open(blob_path)

          # Calculate the scaling factor to reduce the size
          scaling_factor = Math.sqrt(max_size.to_f / file_size)
          new_width = (image.width * scaling_factor).to_i
          new_height = (image.height * scaling_factor).to_i

          # Resize the image
          image.resize "#{new_width}x#{new_height}"

          # Optionally, you can also compress the image
          image.quality @img_compression  # Adjust quality as needed (0-100)

          # Save the modified image to a temporary file
          temp_file = "#{blob_path}.tmp"
          image.write(temp_file)

          # Use the temporary file for upload
          image_bytes = File.binread(temp_file)
          File.delete(temp_file)  # Clean up the temporary file
        else
          image_bytes = File.binread(blob_path)  # No changes made here
        end
      else
        image_bytes = File.binread(blob_path)
      end

      begin
        response = HTTParty.post(
          upload_blob_uri(session.pds),
          body: image_bytes,
          headers: default_authenticated_headers(session).merge("Content-Type" => content_type)
        )

        if response.success?
          response
        else
          puts "Error uploading blob: #{response.code} - #{response.message}"
          nil
        end
      rescue => e
        puts "Error uploading blob: #{e.message}"
        nil
      end
    end

    def upload_video_blob(file_path, content_type)
      # Check video file size (50MB limit as reasonable default)
      max_video_size = 50 * 1024 * 1024  # 50MB in bytes
      file_size = File.size(file_path)
      
      if file_size > max_video_size
        raise "Video file too large: #{file_size} bytes (#{(file_size / 1024.0 / 1024.0).round(2)}MB). Maximum allowed: #{max_video_size / 1024 / 1024}MB"
      end
      
      puts "Uploading video: #{File.basename(file_path)} (#{(file_size / 1024.0 / 1024.0).round(2)}MB)"
      
      # Get service authentication token for video service
      puts "Getting service auth for video upload..."
      puts "Session PDS: #{session.pds}"
      puts "Session DID: #{session.did}"
      puts "Service endpoint: #{session.service_endpoint}"
      
      video_service_url = "https://video.bsky.app"
      auth_uri = get_service_auth_uri(session.pds, video_service_url, "app.bsky.video.uploadVideo", (Time.now.to_i + 3600).to_s)
      puts "Requesting service auth from: #{auth_uri}"
      
      service_auth_response = HTTParty.get(
        auth_uri,
        headers: default_authenticated_headers(session)
      )
      
      unless service_auth_response&.success? && service_auth_response["token"]
        puts "Service auth response: #{service_auth_response.inspect}"
        raise "Failed to get service auth token: #{service_auth_response&.code} - #{service_auth_response&.message}"
      end
      
      video_token = service_auth_response["token"]
      puts "Service auth successful, got token: #{video_token[0..20]}..." # Log first 20 chars for debugging

      # Upload video and get job ID
      video_bytes = File.binread(file_path)
      upload_url = upload_video_uri(video_service_url, session.did, File.basename(file_path))
      puts "Uploading to URL: #{upload_url}"
      puts "Video size: #{video_bytes.size} bytes"
      
      response = HTTParty.post(
        upload_url,
        body: video_bytes,
        headers: {"Authorization" => "Bearer #{video_token}", "Content-Type" => content_type, "Content-Length" => video_bytes.size.to_s}
      )
      
      unless response&.success? && response["jobId"]
        puts "Video upload response: #{response.inspect}"
        puts "Response body: #{response.body}" if response
        raise "Failed to upload video: #{response&.code} - #{response&.message}"
      end
      
      job_id = response["jobId"]
      puts "Video upload started with job ID: #{job_id}"

      # Poll for job completion
      start_time = Time.now
      timeout = 300  # 5 minutes timeout
      job_status_response = nil

      loop do
        job_status_response = HTTParty.get(
          get_video_job_status_uri(video_service_url, job_id),
          headers: {"Authorization" => "Bearer #{video_token}"}
        )

        unless job_status_response&.success?
          raise "Failed to get job status: #{job_status_response&.code} - #{job_status_response&.message}"
        end
        
        unless job_status_response["jobStatus"]
          raise "Invalid job status response format: #{job_status_response.inspect}"
        end

        state = job_status_response["jobStatus"]["state"]
        puts "Video processing status: #{state}"
        
        break if [JOB_STATE_COMPLETED, JOB_STATE_FAILED].include?(state)

        if Time.now - start_time > timeout
          raise "Video processing timed out after #{timeout} seconds"
        end

        sleep(5)
      end

      if job_status_response["jobStatus"]["state"] == JOB_STATE_COMPLETED
        puts "Video processing completed successfully"
        job_status_response["jobStatus"]["blob"]
      else
        raise "Video processing failed: #{job_status_response["jobStatus"]["state"]}"
      end
    rescue => e
      puts "Error in upload_video_blob: #{e.message}"
      raise e
    end

    def create_post_or_reply(text, reply_to: nil, embed_url: nil, embed_images: [], embed_video: nil, created_at: DateTime.now.iso8601(3), langs: ["en-US"], facets: [])
      # Create facets from text, supplementing with any manual facets provided
      all_facets = create_facets(text, manual_facets: facets) || []  # Ensure facets is always an array

      input = {
        "collection" => "app.bsky.feed.post",
        "repo" => session.did,
        "record" => {
          "$type" => "app.bsky.feed.post",
          "createdAt" => created_at,
          "text" => text,
          "facets" => all_facets,
          "langs" => langs
        }
      }

      # Remove empty facets array to avoid API validation errors
      if input["record"]["facets"].empty?
        input["record"].delete("facets")
      end

      if reply_to
        root = find_root_post(reply_to)
        input["record"]["reply"] = {
          "parent" => {
            "uri" => reply_to.uri,
            "cid" => reply_to.cid
          },
          "root" => {
            "uri" => root.uri,
            "cid" => root.cid
          }
        }
      end

      if embed_url
        input["record"]["embed"] = create_external_embed(embed_url, self)
      elsif embed_images.any?
        input["record"]["embed"] = create_image_embed(embed_images, self)
      elsif embed_video
        input["record"]["embed"] = create_video_embed(embed_video, self)
      end

      create_record(input)
    end

    def find_root_post(post)
      return post unless post.record.respond_to?(:[]) && post.record["reply"]

      root_uri = post.record["reply"]["root"]["uri"]
      get_post_by_url(root_uri)
    end

    def create_post(text, embed_url: nil, embed_images: [], embed_video: nil, created_at: DateTime.now.iso8601(3), langs: ["en-US"], facets: [])
      create_post_or_reply(text, embed_url: embed_url, embed_images: embed_images, embed_video: embed_video, created_at: created_at, langs: langs, facets: facets)
    end

    def create_reply(replylink, text, embed_url: nil, embed_images: [], embed_video: nil, created_at: DateTime.now.iso8601(3), langs: ["en-US"], facets: [])
      reply_to = get_post_by_url(replylink)
      if reply_to.nil?
        raise "Failed to fetch the post to reply to"
      end

      create_post_or_reply(text, reply_to: reply_to, embed_url: embed_url, embed_images: embed_images, embed_video: embed_video, created_at: created_at, langs: langs, facets: facets)
    end

    def get_profile(username)
      HTTParty.get(
        get_profile_uri(session.pds, username),
        headers: default_authenticated_headers(session)
      )
    end

    def get_followers(username, cursor: nil)
      HTTParty.get(
        get_followers_uri(session.pds, username, cursor),
        headers: default_authenticated_headers(session)
      )
    end

    def get_post_thread(post_url, depth = 10)
      at_uri = at_post_link(session.pds, post_url)
      query = Bskyrb::AppBskyFeedGetpostthread::GetPostThread::Input.new.tap do |q|
        q.uri = at_uri
        q.depth = depth
      end

      HTTParty.get(
        get_post_thread_uri(session.pds, query),
        headers: default_authenticated_headers(session)
      )
    end

    def profile_action(username, type)
      input = Bskyrb::ComAtprotoRepoCreaterecord::CreateRecord::Input.from_hash({
        "collection" => type,
        "repo" => session.did,
        "record" => {
          "subject" => resolve_handle(session.pds, username)["did"],
          "createdAt" => DateTime.now.iso8601(3),
          "$type" => type
        }
      })
      create_record(input)
    end

    def post_action(post, action_type)
      data = {
        collection: action_type,
        repo: session.did,
        record: {
          subject: {
            uri: post.uri,
            cid: post.cid
          },
          createdAt: DateTime.now.iso8601(3),
          "$type": action_type
        }
      }
      create_record(data)
    end

    def like(post_url)
      post = get_post_by_url(post_url)
      post_action(post, "app.bsky.feed.like")
    end

    def repost(post_url)
      post = get_post_by_url(post_url)
      post_action(post, "app.bsky.feed.repost")
    end

    def follow(username)
      profile_action(username, "app.bsky.graph.follow")
    end

    def block(username)
      profile_action(username, "app.bsky.graph.block")
    end

    def mute(username)
      HTTParty.post(
        mute_actor_uri(session.pds),
        body: {actor: resolve_handle(username)}.to_json,
        headers: default_authenticated_headers(session)
      )
    end

    def get_latest_post(username)
      feed = get_latest_n_posts(username, 1)
      feed.feed.first
    end

    def get_latest_n_posts(username, n)
      # Build the endpoint URL
      url = "#{session.pds}/xrpc/app.bsky.feed.getAuthorFeed?actor=#{username}&limit=#{n}"
      res = HTTParty.get(url, headers: default_authenticated_headers(session))
      if res.success?
        hydrate_feed(res, Bskyrb::AppBskyFeedGetauthorfeed::GetAuthorFeed::Output)
      else
        raise "API request failed: #{res.code} - #{res.message}"
      end
    rescue
      nil
    end

    def get_skyline(n)
      url = "#{session.pds}/xrpc/app.bsky.feed.getTimeline?limit=#{n}"
      res = HTTParty.get(url, headers: default_authenticated_headers(session))
      if res.success?
        hydrate_feed(res, Bskyrb::AppBskyFeedGettimeline::GetTimeline::Output)
      else
        raise "API request failed: #{res.code} - #{res.message}"
      end
    rescue
      nil
    end

    def get_popular(n)
      url = "#{session.pds}/xrpc/app.bsky.unspecced.getPopular?limit=#{n}"
      res = HTTParty.get(url, headers: default_authenticated_headers(session))
      if res.success?
        hydrate_feed(res, Bskyrb::AppBskyUnspeccedGetpopular::GetPopular::Output)
      else
        raise "API request failed: #{res.code} - #{res.message}"
      end
    rescue
      nil
    end

    def hydrate_feed(response_hash, klass)
      klass.from_hash(response_hash).tap do |feed|
        feed.feed = response_hash["feed"].map do |h|
          Bskyrb::AppBskyFeedDefs::FeedViewPost.from_hash(h).tap do |obj|
            obj.post = Bskyrb::AppBskyFeedDefs::PostView.from_hash h["post"]
            obj.reply = Bskyrb::AppBskyFeedDefs::ReplyRef.from_hash h["reply"] if h["reply"]
          end
        end
      end
    end

    # Deletes a post by URL or PostView object
    def delete_post(post_or_url)
      post = post_or_url.is_a?(String) ? get_post_by_url(post_or_url) : post_or_url
      raise ArgumentError, "Could not resolve post" unless post && post.uri

      # Parse AT URI: at://did/collection/rkey
      at_uri = post.uri
      uri_parts = at_uri.split("/")
      raise ArgumentError, "Invalid post URI: #{at_uri}" unless uri_parts.length == 5
      repo = uri_parts[2]
      collection = uri_parts[3]
      rkey = uri_parts[4]

      input = {
        "repo" => repo,
        "collection" => collection,
        "rkey" => rkey
      }

      res = HTTParty.post(
        delete_record_uri(session.pds),
        body: input.to_json,
        headers: default_authenticated_headers(session)
      )
      if res.success?
        res
      else
        raise "API request failed: #{res.code} - #{res.message}"
      end
    rescue
      nil
    end
  end
end
