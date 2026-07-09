# typed: true

require "bskyrb/post_tools"

module Bskyrb
  class Client
    include ATProto::RequestUtils
    include PostTools

    attr_reader :session

    # Job state constants for video processing
    JOB_STATE_COMPLETED = "JOB_STATE_COMPLETED"
    JOB_STATE_FAILED = "JOB_STATE_FAILED"
    VIDEO_SERVICE_URL = "https://video.bsky.app"
    VIDEO_SERVICE_DID = "did:web:video.bsky.app"

    def initialize(session)
      @session = session
      @pds = session.credentials.pds
    end

    def create_record(input)
      request_body = normalize_request_body(input)
      authenticated_request(
        :post,
        create_record_uri(session.pds),
        body: request_body.to_json
      )
    end

    def get_post_by_url(url, depth = 10)
      at_uri = at_post_link(session.pds, url)
      query = Bskyrb::AppBskyFeedGetpostthread::GetPostThread::Input.new.tap do |q|
        q.uri = at_uri
        q.depth = depth
      end

      full_uri = get_post_thread_uri(session.pds, query)

      res = authenticated_request(
        :get,
        full_uri
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
    rescue => e
      Bskyrb.logger.error("Error fetching post by URL: #{e.message}")
      nil
    end

    def upload_blob(blob_path, content_type)
      # Image compression is handled by upload_image/compress_image in PostTools.
      # This method just reads and uploads the bytes as-is.
      image_bytes = File.binread(blob_path)

      response = authenticated_request(
        :post,
        upload_blob_uri(session.pds),
        body: image_bytes,
        headers: {"Content-Type" => content_type}
      )

      if response.success?
        response
      else
        Bskyrb.logger.error("Error uploading blob: #{response.code} - #{response.message}")
        nil
      end
    rescue => e
      Bskyrb.logger.error("Error uploading blob: #{e.message}")
      nil
    end

    def upload_video_blob(file_path, content_type)
      # Check video file size (300MB limit, matching Bluesky's maximum)
      max_video_size = 300 * 1000 * 1000
      file_size = File.size(file_path)

      if file_size > max_video_size
        raise "Video file too large: #{file_size} bytes (#{(file_size / 1024.0 / 1024.0).round(2)}MB). Maximum allowed: #{max_video_size / 1024 / 1024}MB"
      end

      Bskyrb.logger.info("Uploading video: #{File.basename(file_path)} (#{(file_size / 1024.0 / 1024.0).round(2)}MB)")

      # Use the session's service endpoint as the audience DID
      # This is derived from the didDoc service endpoint in the session
      video_service_did = session.service_endpoint

      check_video_upload_limits!
      video_token = service_auth_token(video_service_did, "com.atproto.repo.uploadBlob", Time.now.to_i + 1800)

      # Upload video and get job ID
      video_bytes = File.binread(file_path)
      upload_url = upload_video_uri(VIDEO_SERVICE_URL, session.did, File.basename(file_path))

      response = HTTParty.post(
        upload_url,
        body: video_bytes,
        headers: {"Authorization" => "Bearer #{video_token}", "Content-Type" => content_type, "Content-Length" => video_bytes.size.to_s}
      )

      upload_status = video_job_status(response)
      return upload_status["blob"] if upload_status&.dig("blob")

      unless response&.success? && upload_status&.dig("jobId")
        # Check for specific error types
        if video_job_error(upload_status, response) == "unconfirmed_email"
          raise "Video upload failed: Bluesky account email not verified. Please check email and verify account before uploading videos."
        end

        error_message = video_job_error(upload_status, response) || response&.message
        raise "Failed to upload video: #{response&.code} - #{error_message}"
      end

      job_id = upload_status["jobId"]
      Bskyrb.logger.info("Video upload started with job ID: #{job_id}")

      # Poll for job completion
      start_time = Time.now
      timeout = 300  # 5 minutes timeout
      job_status_response = nil

      loop do
        job_status_response = HTTParty.get(
          get_video_job_status_uri(VIDEO_SERVICE_URL, job_id),
          headers: {"Authorization" => "Bearer #{video_token}"}
        )

        unless job_status_response&.success?
          raise "Failed to get job status: #{job_status_response&.code} - #{job_status_response&.message}"
        end

        job_status = video_job_status(job_status_response)
        unless job_status
          raise "Invalid job status response format"
        end

        state = job_status["state"]
        Bskyrb.logger.debug("Video processing status: #{state}")

        break if [JOB_STATE_COMPLETED, JOB_STATE_FAILED].include?(state)

        if Time.now - start_time > timeout
          raise "Video processing timed out after #{timeout} seconds"
        end

        sleep(5)
      end

      job_status = video_job_status(job_status_response)
      if job_status["state"] == JOB_STATE_COMPLETED
        Bskyrb.logger.info("Video processing completed successfully")
        job_status["blob"]
      else
        raise "Video processing failed: #{job_status["state"]}"
      end
    end

    def normalize_request_body(input)
      body = (input.respond_to?(:to_h) && !input.is_a?(Hash)) ? input.to_h : input
      compact_nil_values(body)
    end

    def compact_nil_values(value)
      case value
      when Hash
        value.each_with_object({}) do |(key, item), output|
          compacted = compact_nil_values(item)
          output[key] = compacted unless compacted.nil?
        end
      when Array
        value.map { |item| compact_nil_values(item) }.compact
      else
        value
      end
    end

    def service_auth_token(aud, lxm, exp = Time.now.to_i + 60)
      auth_uri = get_service_auth_uri(session.pds, aud, lxm, exp.to_s)
      service_auth_response = authenticated_request(:get, auth_uri)

      unless service_auth_response&.success? && service_auth_response["token"]
        Bskyrb.logger.error("Service auth failed: #{service_auth_response&.code} - #{service_auth_response&.message}")
        raise "Failed to get service auth token: #{service_auth_response&.code} - #{service_auth_response&.message}"
      end

      service_auth_response["token"]
    end

    def check_video_upload_limits!
      response = video_upload_limits_response
      return unless response

      unless response&.success?
        Bskyrb.logger.warn("Could not check video upload limits: #{response&.code} - #{response&.message}; proceeding with upload")
        return
      end

      body = response_body_hash(response)
      if body&.key?("canUpload")
        return if body["canUpload"]

        reason = body["message"] || body["error"] || "Video upload is not currently allowed for this account"
        raise "Video upload unavailable: #{reason}"
      end

      Bskyrb.logger.warn("Video upload limits response did not include canUpload; proceeding with upload")
    end

    def video_upload_limits_response
      limits_token = service_auth_token(VIDEO_SERVICE_DID, "app.bsky.video.getUploadLimits")
      HTTParty.get(
        get_video_upload_limits_uri(VIDEO_SERVICE_URL),
        headers: {"Authorization" => "Bearer #{limits_token}"}
      )
    rescue => e
      Bskyrb.logger.warn("Could not check video upload limits: #{e.message}; proceeding with upload")
      nil
    end

    def video_job_status(response)
      body = response_body_hash(response)
      return body["jobStatus"] if body&.dig("jobStatus").is_a?(Hash)

      body
    end

    def video_job_error(status, response)
      status_error = status["error"] || status["message"] if status.is_a?(Hash)
      body = response_body_hash(response)
      status_error || body&.dig("jobStatus", "error") || body&.dig("error") || body&.dig("message")
    end

    def response_body_hash(response)
      parsed_response = response&.parsed_response
      parsed_response if parsed_response.is_a?(Hash)
    end

    def authenticated_request(method, uri, headers: {}, retry_on_unauthorized: true, **options)
      response = HTTParty.public_send(
        method,
        uri,
        **options.merge(headers: default_authenticated_headers(session).merge(headers))
      )
      return response unless retry_on_unauthorized && response&.code == 401

      Bskyrb.logger.info("Refreshing ATProto session after authenticated request returned 401")
      session.refresh!
      HTTParty.public_send(
        method,
        uri,
        **options.merge(headers: default_authenticated_headers(session).merge(headers))
      )
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
      root = get_post_by_url(root_uri)
      raise "Failed to fetch root post for reply thread" if root.nil?
      root
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
      authenticated_request(:get, get_profile_uri(session.pds, username))
    end

    def get_followers(username, cursor: nil)
      authenticated_request(:get, get_followers_uri(session.pds, username, cursor))
    end

    def get_post_thread(post_url, depth = 10)
      at_uri = at_post_link(session.pds, post_url)
      query = Bskyrb::AppBskyFeedGetpostthread::GetPostThread::Input.new.tap do |q|
        q.uri = at_uri
        q.depth = depth
      end

      authenticated_request(:get, get_post_thread_uri(session.pds, query))
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
      raise "Failed to fetch the post to like" if post.nil?
      post_action(post, "app.bsky.feed.like")
    end

    def repost(post_url)
      post = get_post_by_url(post_url)
      raise "Failed to fetch the post to repost" if post.nil?
      post_action(post, "app.bsky.feed.repost")
    end

    def follow(username)
      profile_action(username, "app.bsky.graph.follow")
    end

    def block(username)
      profile_action(username, "app.bsky.graph.block")
    end

    def mute(username)
      authenticated_request(
        :post,
        mute_actor_uri(session.pds),
        body: {actor: resolve_handle(session.pds, username)["did"]}.to_json
      )
    end

    def get_latest_post(username)
      feed = get_latest_n_posts(username, 1)
      feed.feed.first
    end

    def get_latest_n_posts(username, n)
      url = "#{session.pds}/xrpc/app.bsky.feed.getAuthorFeed?actor=#{username}&limit=#{n}"
      res = authenticated_request(:get, url)
      if res.success?
        hydrate_feed(res, Bskyrb::AppBskyFeedGetauthorfeed::GetAuthorFeed::Output)
      else
        raise "API request failed: #{res.code} - #{res.message}"
      end
    rescue => e
      Bskyrb.logger.error("Error fetching posts for #{username}: #{e.message}")
      nil
    end

    def get_skyline(n)
      url = "#{session.pds}/xrpc/app.bsky.feed.getTimeline?limit=#{n}"
      res = authenticated_request(:get, url)
      if res.success?
        hydrate_feed(res, Bskyrb::AppBskyFeedGettimeline::GetTimeline::Output)
      else
        raise "API request failed: #{res.code} - #{res.message}"
      end
    rescue => e
      Bskyrb.logger.error("Error fetching timeline: #{e.message}")
      nil
    end

    def get_popular(n)
      url = "#{session.pds}/xrpc/app.bsky.unspecced.getPopular?limit=#{n}"
      res = authenticated_request(:get, url)
      if res.success?
        hydrate_feed(res, Bskyrb::AppBskyUnspeccedGetpopular::GetPopular::Output)
      else
        raise "API request failed: #{res.code} - #{res.message}"
      end
    rescue => e
      Bskyrb.logger.error("Error fetching popular posts: #{e.message}")
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
      raise ArgumentError, "Could not resolve post" unless post&.uri

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

      res = authenticated_request(
        :post,
        delete_record_uri(session.pds),
        body: input.to_json
      )
      if res.success?
        res
      else
        raise "API request failed: #{res.code} - #{res.message}"
      end
    rescue => e
      Bskyrb.logger.error("Error deleting post: #{e.message}")
      nil
    end
  end
end
