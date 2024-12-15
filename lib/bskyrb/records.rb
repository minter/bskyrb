# typed: true

require "bskyrb/post_tools"
require "mini_magick"

module Bskyrb
  class Client
    include ATProto::RequestUtils
    include PostTools
    attr_reader :session

    # First, let's add these constants at the top of the file
    JOB_STATE_COMPLETED = "completed"
    JOB_STATE_FAILED = "failed"

    def initialize(session)
      @session = session
      @pds = session.credentials.pds
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
    rescue => e
      nil
    end

    def upload_blob(blob_path, content_type)
      if content_type.include?("image")
        # only images
        max_size = 900 * 1024  # 900KB in bytes
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
          image.quality "85"  # Adjust quality as needed (0-100)

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

      HTTParty.post(
        upload_blob_uri(session.pds),
        body: image_bytes,
        headers: default_authenticated_headers(session).merge("Content-Type" => content_type)
      )
    end

    def upload_video_blob(file_path, content_type)
      service_auth_response = HTTParty.get(
        get_service_auth_uri(session.pds, session.service_endpoint, "com.atproto.repo.uploadBlob", (Time.now.to_i + 3600).to_s),
        headers: default_authenticated_headers(session)
      )

      video_bytes = File.binread(file_path)
      response = HTTParty.post(
        upload_video_uri("https://video.bsky.app", session.did, File.basename(file_path)),
        body: video_bytes,
        headers: {"Authorization" => "Bearer #{service_auth_response["token"]}", "Content-Type" => content_type, "Content-Length" => video_bytes.size.to_s}
      )
      job_id = response["jobId"]

      start_time = Time.now
      timeout = 300  # 5 minutes timeout
      job_status_response = nil  # Declare the variable before the loop

      loop do
        job_status_response = HTTParty.get(
          get_video_job_status_uri("https://video.bsky.app", job_id),
          headers: {"Authorization" => "Bearer #{service_auth_response["token"]}"}
        )

        state = job_status_response["jobStatus"]["state"]
        break if ["JOB_STATE_COMPLETED", "JOB_STATE_FAILED"].include?(state)

        if Time.now - start_time > timeout
          raise "Video processing timed out after #{timeout} seconds"
        end

        sleep(5)
      end

      if job_status_response["jobStatus"]["state"] == "JOB_STATE_COMPLETED"
        job_status_response["jobStatus"]["blob"]
      else
        raise "Video processing failed: #{job_status_response["jobStatus"]["state"]}"
      end
    end

    def create_post_or_reply(text, reply_to: nil, embed_url: nil, embed_images: [], embed_video: nil)
      facets = create_facets(text) || []  # Ensure facets is always an array

      input = {
        "collection" => "app.bsky.feed.post",
        "repo" => session.did,
        "record" => {
          "$type" => "app.bsky.feed.post",
          "createdAt" => DateTime.now.iso8601(3),
          "text" => text,
          "facets" => facets
        }
      }

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

    def create_post(text, embed_url: nil, embed_images: [], embed_video: nil)
      create_post_or_reply(text, embed_url: embed_url, embed_images: embed_images, embed_video: embed_video)
    end

    def create_reply(replylink, text, embed_url: nil, embed_images: [], embed_video: nil)
      reply_to = get_post_by_url(replylink)
      if reply_to.nil?
        raise "Failed to fetch the post to reply to"
      end

      create_post_or_reply(text, reply_to: reply_to, embed_url: embed_url, embed_images: embed_images, embed_video: embed_video)
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
      endpoint = XRPC::EasyEndpoint.new(session.pds, "app.bsky.feed.getAuthorFeed", authenticated: true)
      endpoint.authenticate(session.access_token)
      hydrate_feed endpoint.get(actor: username, limit: n), Bskyrb::AppBskyFeedGetauthorfeed::GetAuthorFeed::Output
    end

    def get_skyline(n)
      endpoint = XRPC::EasyEndpoint.new(session.pds, "app.bsky.feed.getTimeline", authenticated: true)
      endpoint.authenticate(session.access_token)
      hydrate_feed endpoint.get(limit: n), Bskyrb::AppBskyFeedGettimeline::GetTimeline::Output
    end

    def get_popular(n)
      endpoint = XRPC::EasyEndpoint.new session.pds, "app.bsky.unspecced.getPopular", authenticated: true
      endpoint.authenticate session.access_token
      hydrate_feed endpoint.get(limit: n), Bskyrb::AppBskyUnspeccedGetpopular::GetPopular::Output
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
  end
end
