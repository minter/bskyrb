# typed: true

require "bskyrb/post_tools"

module Bskyrb
  class Client
    include ATProto::RequestUtils
    include PostTools
    attr_reader :session

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
      query = Bskyrb::AppBskyFeedGetpostthread::GetPostThread::Input.new.tap do |q|
        q.uri = at_post_link(session.pds, url)
        q.depth = depth
      end
      res = HTTParty.get(
        get_post_thread_uri(session.pds, query),
        headers: default_authenticated_headers(session)
      )
      Bskyrb::AppBskyFeedDefs::PostView.from_hash res["thread"]["post"]
    end

    def upload_blob(blob_path, content_type)
      # only images
      image_bytes = File.binread(blob_path)
      HTTParty.post(
        upload_blob_uri(session.pds),
        body: image_bytes,
        headers: default_authenticated_headers(session).merge("Content-Type" => content_type)
      )
    end

    def create_post_or_reply(text, reply_to: nil, embed_url: nil)
      facets = create_facets(text) || []  # Ensure facets is always an array
      
      input = {
        "collection" => "app.bsky.feed.post",
        "$type" => "app.bsky.feed.post",
        "repo" => session.did,
        "record" => {
          "$type" => "app.bsky.feed.post",
          "createdAt" => DateTime.now.iso8601(3),
          "text" => text,
          "facets" => facets
        }
      }
      if reply_to
        input["record"]["reply"] = {
          "parent" => {
            "uri" => reply_to.uri,
            "cid" => reply_to.cid
          },
          "root" => {
            "uri" => reply_to.uri,
            "cid" => reply_to.cid
          }
        }
      end
      if embed_url
        input["record"]["embed"] = create_embed(embed_url, self)
      end
      create_record(input)
    end

    def create_post(text, embed_url: nil)
      create_post_or_reply(text, embed_url:)
    end

    def create_reply(replylink, text, embed_url: nil)
      reply_to = get_post_by_url(replylink)
      create_post_or_reply(text, reply_to:, embed_url:)
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
