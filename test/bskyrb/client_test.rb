# typed: true
# frozen_string_literal: true

require "test_helper"

module Bskyrb
  class ClientTest < Minitest::Test
    SERVICE_ENDPOINT = "did:web:morel.us-east.host.bsky.network"
    DID_DOC = {
      "service" => [
        {"serviceEndpoint" => "https://morel.us-east.host.bsky.network"}
      ]
    }

    def create_session
      stub_request(:post, "https://bsky.social/xrpc/com.atproto.server.createSession").to_return(
        status: 200,
        headers: {"Content-Type" => "application/json"},
        body: {
          "accessJwt" => "ACCESS_JWT",
          "refreshJwt" => "REFRESH_JWT",
          "did" => "did:plc:testuser123",
          "didDoc" => DID_DOC
        }.to_json
      )

      credentials = ATProto::Credentials.new("test.bsky.social", "password")
      ATProto::Session.new(credentials)
    end

    def stub_video_service_auth
      stub_request(:get, /com\.atproto\.server\.getServiceAuth.*app\.bsky\.video\.getUploadLimits/)
        .to_return(status: 200, body: {"token" => "LIMITS_TOKEN"}.to_json, headers: {"Content-Type" => "application/json"})

      stub_request(:get, "https://video.bsky.app/xrpc/app.bsky.video.getUploadLimits")
        .to_return(status: 200, body: {"canUpload" => true}.to_json, headers: {"Content-Type" => "application/json"})

      stub_request(:get, /com\.atproto\.server\.getServiceAuth.*com\.atproto\.repo\.uploadBlob/)
        .to_return(status: 200, body: {"token" => "UPLOAD_TOKEN"}.to_json, headers: {"Content-Type" => "application/json"})
    end

    def with_temp_video
      tempfile = Tempfile.new(["test-video", ".mp4"])
      tempfile.binmode
      tempfile.write("fake video data")
      tempfile.close
      yield tempfile.path
    ensure
      tempfile&.unlink
    end

    def video_blob
      {
        "$type" => "blob",
        "ref" => {"$link" => "bafkvideo"},
        "mimeType" => "video/mp4",
        "size" => 1234
      }
    end

    def stub_refresh_session(access_token: "NEW_ACCESS_JWT", refresh_token: "NEW_REFRESH_JWT")
      stub_request(:post, "https://bsky.social/xrpc/com.atproto.server.refreshSession")
        .with(headers: {"Authorization" => "Bearer REFRESH_JWT"})
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {
            "accessJwt" => access_token,
            "refreshJwt" => refresh_token
          }.to_json
        )
    end

    def test_delete_post_parses_at_uri_correctly
      session = create_session

      stub_request(:get, /app.bsky.feed.getPostThread/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {
            "thread" => {
              "post" => {
                "uri" => "at://did:plc:testuser123/app.bsky.feed.post/abc123",
                "cid" => "bafyreicid123",
                "record" => {"text" => "test post"},
                "author" => {"did" => "did:plc:testuser123", "handle" => "test.bsky.social"},
                "indexedAt" => "2024-01-01T00:00:00Z"
              }
            }
          }.to_json
        )

      delete_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.deleteRecord")
        .with(
          body: hash_including(
            "repo" => "did:plc:testuser123",
            "collection" => "app.bsky.feed.post",
            "rkey" => "abc123"
          )
        )
        .to_return(status: 200, body: "{}".to_json, headers: {"Content-Type" => "application/json"})

      # Stub resolve_handle for at_post_link
      stub_request(:get, /com.atproto.identity.resolveHandle/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"did" => "did:plc:testuser123"}.to_json
        )

      client = Client.new(session)
      client.delete_post("https://bsky.app/profile/test.bsky.social/post/abc123")

      assert_requested delete_stub
    end

    def test_delete_post_with_post_view_object
      session = create_session

      # Create a mock PostView-like object
      post = Struct.new(:uri, :cid).new(
        "at://did:plc:testuser123/app.bsky.feed.post/xyz789",
        "bafyreicid456"
      )

      delete_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.deleteRecord")
        .with(
          body: hash_including(
            "repo" => "did:plc:testuser123",
            "collection" => "app.bsky.feed.post",
            "rkey" => "xyz789"
          )
        )
        .to_return(status: 200, body: "{}".to_json, headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.delete_post(post)

      assert_requested delete_stub
    end

    def test_mute_calls_resolve_handle_with_pds
      session = create_session

      resolve_stub = stub_request(:get, "https://bsky.social/xrpc/com.atproto.identity.resolveHandle?handle=spammer.bsky.social")
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"did" => "did:plc:spammer123"}.to_json
        )

      stub_request(:post, "https://bsky.social/xrpc/app.bsky.graph.muteActor")
        .to_return(status: 200, body: "{}".to_json, headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.mute("spammer.bsky.social")

      assert_requested resolve_stub
    end

    def test_mute_sends_actor_as_resolved_did_string
      session = create_session

      stub_request(:get, "https://bsky.social/xrpc/com.atproto.identity.resolveHandle?handle=spammer.bsky.social")
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"did" => "did:plc:spammer123"}.to_json
        )

      mute_stub = stub_request(:post, "https://bsky.social/xrpc/app.bsky.graph.muteActor")
        .with { |request| JSON.parse(request.body) == {"actor" => "did:plc:spammer123"} }
        .to_return(status: 200, body: "{}".to_json, headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.mute("spammer.bsky.social")

      assert_requested mute_stub
    end

    def test_create_record_refreshes_session_once_after_unauthorized_response
      session = create_session
      refresh_stub = stub_refresh_session

      create_attempts = []
      create_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .to_return { |request|
          create_attempts << request.headers["Authorization"]
          if request.headers["Authorization"] == "Bearer ACCESS_JWT"
            {status: 401, body: {"error" => "ExpiredToken"}.to_json, headers: {"Content-Type" => "application/json"}}
          else
            {status: 200, body: {"uri" => "at://test"}.to_json, headers: {"Content-Type" => "application/json"}}
          end
        }

      client = Client.new(session)
      response = client.create_record({"repo" => session.did, "collection" => "app.bsky.feed.post", "record" => {"text" => "hello"}})

      assert response.success?
      assert_equal "NEW_ACCESS_JWT", session.access_token
      assert_equal "NEW_REFRESH_JWT", session.refresh_token
      assert_equal ["Bearer ACCESS_JWT", "Bearer NEW_ACCESS_JWT"], create_attempts
      assert_requested refresh_stub
      assert_requested create_stub, times: 2
    end

    def test_authenticated_request_does_not_retry_more_than_once_after_refresh
      session = create_session
      stub_refresh_session

      create_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .to_return(
          {status: 401, body: {"error" => "ExpiredToken"}.to_json, headers: {"Content-Type" => "application/json"}},
          {status: 401, body: {"error" => "ExpiredToken"}.to_json, headers: {"Content-Type" => "application/json"}}
        )

      client = Client.new(session)
      response = client.create_record({"repo" => session.did, "collection" => "app.bsky.feed.post", "record" => {"text" => "hello"}})

      assert_equal 401, response.code
      assert_requested create_stub, times: 2
    end

    def test_upload_blob_returns_response_on_success
      session = create_session

      stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.uploadBlob")
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {
            "blob" => {
              "ref" => {"$link" => "bafkrei123"},
              "mimeType" => "image/jpeg",
              "size" => 12345
            }
          }.to_json
        )

      client = Client.new(session)

      # Create a temp file to upload
      tempfile = Tempfile.new(["test", ".jpg"])
      tempfile.write("fake image data")
      tempfile.close

      begin
        result = client.upload_blob(tempfile.path, "image/jpeg")
        assert result
        assert_equal "bafkrei123", result["blob"]["ref"]["$link"]
      ensure
        tempfile.unlink
      end
    end

    def test_upload_blob_returns_nil_on_failure
      session = create_session

      stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.uploadBlob")
        .to_return(status: 400, body: '{"error": "InvalidRequest"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)

      tempfile = Tempfile.new(["test", ".jpg"])
      tempfile.write("fake image data")
      tempfile.close

      begin
        result = client.upload_blob(tempfile.path, "image/jpeg")
        assert_nil result
      ensure
        tempfile.unlink
      end
    end

    def test_upload_video_blob_accepts_top_level_job_status_response
      session = create_session
      stub_video_service_auth

      stub_request(:post, /app\.bsky\.video\.uploadVideo/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"jobId" => "job123", "state" => "JOB_STATE_PROCESSING"}.to_json
        )

      stub_request(:get, "https://video.bsky.app/xrpc/app.bsky.video.getJobStatus?jobId=job123")
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"jobStatus" => {"jobId" => "job123", "state" => "JOB_STATE_COMPLETED", "blob" => video_blob}}.to_json
        )

      client = Client.new(session)

      with_temp_video do |path|
        result = client.upload_video_blob(path, "video/mp4")
        assert_equal "bafkvideo", result["ref"]["$link"]
      end
    end

    def test_upload_video_blob_refreshes_session_for_service_auth
      session = create_session
      refresh_stub = stub_refresh_session

      stub_request(:get, /com\.atproto\.server\.getServiceAuth.*app\.bsky\.video\.getUploadLimits/)
        .to_return(status: 200, body: {"token" => "LIMITS_TOKEN"}.to_json, headers: {"Content-Type" => "application/json"})

      stub_request(:get, "https://video.bsky.app/xrpc/app.bsky.video.getUploadLimits")
        .to_return(status: 200, body: {"canUpload" => true}.to_json, headers: {"Content-Type" => "application/json"})

      service_auth_attempts = []
      service_auth_stub = stub_request(:get, /com\.atproto\.server\.getServiceAuth.*com\.atproto\.repo\.uploadBlob/)
        .to_return { |request|
          service_auth_attempts << request.headers["Authorization"]
          if request.headers["Authorization"] == "Bearer ACCESS_JWT"
            {status: 401, body: {"error" => "ExpiredToken"}.to_json, headers: {"Content-Type" => "application/json"}}
          else
            {status: 200, body: {"token" => "UPLOAD_TOKEN"}.to_json, headers: {"Content-Type" => "application/json"}}
          end
        }

      stub_request(:post, /app\.bsky\.video\.uploadVideo/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"jobStatus" => {"jobId" => "job-with-refresh", "state" => "JOB_STATE_PROCESSING"}}.to_json
        )

      stub_request(:get, "https://video.bsky.app/xrpc/app.bsky.video.getJobStatus?jobId=job-with-refresh")
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"jobStatus" => {"jobId" => "job-with-refresh", "state" => "JOB_STATE_COMPLETED", "blob" => video_blob}}.to_json
        )

      client = Client.new(session)

      with_temp_video do |path|
        result = client.upload_video_blob(path, "video/mp4")
        assert_equal "bafkvideo", result["ref"]["$link"]
      end

      assert_requested refresh_stub
      assert_equal ["Bearer ACCESS_JWT", "Bearer NEW_ACCESS_JWT"], service_auth_attempts
      assert_requested service_auth_stub, times: 2
    end

    def test_upload_video_blob_accepts_wrapped_upload_response
      session = create_session
      stub_video_service_auth

      stub_request(:post, /app\.bsky\.video\.uploadVideo/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"jobStatus" => {"jobId" => "job456", "state" => "JOB_STATE_PROCESSING"}}.to_json
        )

      stub_request(:get, "https://video.bsky.app/xrpc/app.bsky.video.getJobStatus?jobId=job456")
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"jobStatus" => {"jobId" => "job456", "state" => "JOB_STATE_COMPLETED", "blob" => video_blob}}.to_json
        )

      client = Client.new(session)

      with_temp_video do |path|
        result = client.upload_video_blob(path, "video/mp4")
        assert_equal "bafkvideo", result["ref"]["$link"]
      end
    end

    def test_upload_video_blob_returns_already_processed_blob
      session = create_session
      stub_video_service_auth

      stub_request(:post, /app\.bsky\.video\.uploadVideo/)
        .to_return(
          status: 409,
          headers: {"Content-Type" => "application/json"},
          body: {"error" => "already_exists", "blob" => video_blob}.to_json
        )

      client = Client.new(session)

      with_temp_video do |path|
        result = client.upload_video_blob(path, "video/mp4")
        assert_equal "bafkvideo", result["ref"]["$link"]
      end
    end

    def test_upload_video_blob_raises_when_upload_limits_disallow_upload
      session = create_session

      stub_request(:get, /com\.atproto\.server\.getServiceAuth.*app\.bsky\.video\.getUploadLimits/)
        .to_return(status: 200, body: {"token" => "LIMITS_TOKEN"}.to_json, headers: {"Content-Type" => "application/json"})

      stub_request(:get, "https://video.bsky.app/xrpc/app.bsky.video.getUploadLimits")
        .to_return(status: 200, body: {"canUpload" => false, "message" => "daily limit reached"}.to_json, headers: {"Content-Type" => "application/json"})

      client = Client.new(session)

      with_temp_video do |path|
        error = assert_raises(RuntimeError) do
          client.upload_video_blob(path, "video/mp4")
        end
        assert_match(/daily limit reached/, error.message)
      end
    end

    def test_upload_video_blob_proceeds_when_upload_limits_check_fails
      session = create_session

      stub_request(:get, /com\.atproto\.server\.getServiceAuth.*app\.bsky\.video\.getUploadLimits/)
        .to_return(status: 503, body: {"error" => "Unavailable"}.to_json, headers: {"Content-Type" => "application/json"})

      stub_request(:get, /com\.atproto\.server\.getServiceAuth.*com\.atproto\.repo\.uploadBlob/)
        .to_return(status: 200, body: {"token" => "UPLOAD_TOKEN"}.to_json, headers: {"Content-Type" => "application/json"})

      stub_request(:post, /app\.bsky\.video\.uploadVideo/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"jobStatus" => {"jobId" => "job789", "state" => "JOB_STATE_PROCESSING"}}.to_json
        )

      stub_request(:get, "https://video.bsky.app/xrpc/app.bsky.video.getJobStatus?jobId=job789")
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"jobStatus" => {"jobId" => "job789", "state" => "JOB_STATE_COMPLETED", "blob" => video_blob}}.to_json
        )

      client = Client.new(session)

      with_temp_video do |path|
        result = client.upload_video_blob(path, "video/mp4")
        assert_equal "bafkvideo", result["ref"]["$link"]
      end
    end

    def test_upload_video_blob_reports_non_json_upload_errors
      session = create_session
      stub_video_service_auth

      stub_request(:post, /app\.bsky\.video\.uploadVideo/)
        .to_return(
          status: 500,
          headers: {"Content-Type" => "text/plain"},
          body: "upstream error"
        )

      client = Client.new(session)

      with_temp_video do |path|
        error = assert_raises(RuntimeError) do
          client.upload_video_blob(path, "video/mp4")
        end
        assert_match(/Failed to upload video: 500/, error.message)
      end
    end

    def test_create_post_sends_correct_structure
      session = create_session

      create_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .with { |request|
          body = JSON.parse(request.body)
          body["collection"] == "app.bsky.feed.post" &&
            body["repo"] == "did:plc:testuser123" &&
            body["record"]["text"] == "Hello world" &&
            body["record"]["$type"] == "app.bsky.feed.post" &&
            body["record"]["langs"] == ["en-US"]
        }
        .to_return(status: 200, body: '{"uri": "at://did:plc:testuser123/app.bsky.feed.post/new123"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.create_post("Hello world")

      assert_requested create_stub
    end

    def test_create_post_with_custom_langs
      session = create_session

      create_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .with { |request|
          body = JSON.parse(request.body)
          body["record"]["langs"] == ["ja"]
        }
        .to_return(status: 200, body: '{"uri": "at://test"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.create_post("Hello", langs: ["ja"])

      assert_requested create_stub
    end

    def test_create_post_strips_empty_facets
      session = create_session

      create_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .with { |request|
          body = JSON.parse(request.body)
          !body["record"].key?("facets")
        }
        .to_return(status: 200, body: '{"uri": "at://test"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.create_post("Hello world")

      assert_requested create_stub
    end

    def test_create_post_includes_hashtag_facets
      session = create_session

      create_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .with { |request|
          body = JSON.parse(request.body)
          facets = body["record"]["facets"]
          facets && facets.length == 1 &&
            facets[0]["features"][0]["$type"] == "app.bsky.richtext.facet#tag" &&
            facets[0]["features"][0]["tag"] == "ruby"
        }
        .to_return(status: 200, body: '{"uri": "at://test"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.create_post("Hello #ruby")

      assert_requested create_stub
    end

    def test_follow_serializes_generated_create_record_input_as_json
      session = create_session

      stub_request(:get, "https://bsky.social/xrpc/com.atproto.identity.resolveHandle?handle=friend.bsky.social")
        .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: {"did" => "did:plc:friend123"}.to_json)

      follow_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .with { |request|
          body = JSON.parse(request.body)
          body["collection"] == "app.bsky.graph.follow" &&
            body["repo"] == "did:plc:testuser123" &&
            body["record"]["subject"] == "did:plc:friend123" &&
            body["record"]["$type"] == "app.bsky.graph.follow" &&
            !body.key?("rkey")
        }
        .to_return(status: 200, body: '{"uri": "at://test"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.follow("friend.bsky.social")

      assert_requested follow_stub
    end

    def test_block_serializes_generated_create_record_input_as_json
      session = create_session

      stub_request(:get, "https://bsky.social/xrpc/com.atproto.identity.resolveHandle?handle=blocked.bsky.social")
        .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: {"did" => "did:plc:blocked123"}.to_json)

      block_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .with { |request|
          body = JSON.parse(request.body)
          body["collection"] == "app.bsky.graph.block" &&
            body["record"]["subject"] == "did:plc:blocked123" &&
            body["record"]["$type"] == "app.bsky.graph.block"
        }
        .to_return(status: 200, body: '{"uri": "at://test"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.block("blocked.bsky.social")

      assert_requested block_stub
    end

    def test_like_raises_when_post_not_found
      session = create_session

      stub_request(:get, /com.atproto.identity.resolveHandle/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"did" => "did:plc:testuser123"}.to_json
        )

      stub_request(:get, /app.bsky.feed.getPostThread/)
        .to_return(status: 404, body: '{"error": "NotFound"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)

      error = assert_raises(RuntimeError) do
        client.like("https://bsky.app/profile/test.bsky.social/post/missing123")
      end
      assert_match(/Failed to fetch the post to like/, error.message)
    end

    def test_repost_raises_when_post_not_found
      session = create_session

      stub_request(:get, /com.atproto.identity.resolveHandle/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"did" => "did:plc:testuser123"}.to_json
        )

      stub_request(:get, /app.bsky.feed.getPostThread/)
        .to_return(status: 404, body: '{"error": "NotFound"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)

      error = assert_raises(RuntimeError) do
        client.repost("https://bsky.app/profile/test.bsky.social/post/missing123")
      end
      assert_match(/Failed to fetch the post to repost/, error.message)
    end

    def test_like_succeeds_with_valid_post
      session = create_session

      stub_request(:get, /com.atproto.identity.resolveHandle/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"did" => "did:plc:testuser123"}.to_json
        )

      stub_request(:get, /app.bsky.feed.getPostThread/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {
            "thread" => {
              "post" => {
                "uri" => "at://did:plc:testuser123/app.bsky.feed.post/abc123",
                "cid" => "bafyreicid123",
                "record" => {"text" => "test post"},
                "author" => {"did" => "did:plc:testuser123", "handle" => "test.bsky.social"},
                "indexedAt" => "2024-01-01T00:00:00Z"
              }
            }
          }.to_json
        )

      like_stub = stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .with { |request|
          body = JSON.parse(request.body)
          body[:collection] == "app.bsky.feed.like" || body["collection"] == "app.bsky.feed.like"
        }
        .to_return(status: 200, body: '{"uri": "at://test"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)
      client.like("https://bsky.app/profile/test.bsky.social/post/abc123")

      assert_requested like_stub
    end

    def test_get_popular_is_deprecated_without_calling_removed_endpoint
      session = create_session
      popular_stub = stub_request(:get, /app\.bsky\.unspecced\.getPopular/)

      client = Client.new(session)

      assert_nil client.get_popular(10)
      assert_not_requested popular_stub
    end

    def test_create_reply_raises_when_parent_not_found
      session = create_session

      stub_request(:get, /com.atproto.identity.resolveHandle/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"did" => "did:plc:testuser123"}.to_json
        )

      stub_request(:get, /app.bsky.feed.getPostThread/)
        .to_return(status: 404, body: '{"error": "NotFound"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)

      error = assert_raises(RuntimeError) do
        client.create_reply("https://bsky.app/profile/test.bsky.social/post/missing123", "Reply text")
      end
      assert_match(/Failed to fetch the post to reply to/, error.message)
    end

    def test_find_root_post_raises_when_root_fetch_fails
      session = create_session

      # First call succeeds (fetching the reply post), second call fails (fetching root)
      call_count = 0
      stub_request(:get, /app.bsky.feed.getPostThread/)
        .to_return { |_request|
          call_count += 1
          if call_count == 1
            {
              status: 200,
              headers: {"Content-Type" => "application/json"},
              body: {
                "thread" => {
                  "post" => {
                    "uri" => "at://did:plc:testuser123/app.bsky.feed.post/reply456",
                    "cid" => "bafyreicidreply",
                    "record" => {
                      "text" => "a reply",
                      "reply" => {
                        "root" => {"uri" => "at://did:plc:testuser123/app.bsky.feed.post/root789", "cid" => "bafyroot"},
                        "parent" => {"uri" => "at://did:plc:testuser123/app.bsky.feed.post/root789", "cid" => "bafyroot"}
                      }
                    },
                    "author" => {"did" => "did:plc:testuser123", "handle" => "test.bsky.social"},
                    "indexedAt" => "2024-01-01T00:00:00Z"
                  }
                }
              }.to_json
            }
          else
            # Root post fetch fails
            {status: 404, body: '{"error": "NotFound"}', headers: {"Content-Type" => "application/json"}}
          end
        }

      stub_request(:get, /com.atproto.identity.resolveHandle/)
        .to_return(
          status: 200,
          headers: {"Content-Type" => "application/json"},
          body: {"did" => "did:plc:testuser123"}.to_json
        )

      stub_request(:post, "https://bsky.social/xrpc/com.atproto.repo.createRecord")
        .to_return(status: 200, body: '{"uri": "at://test"}', headers: {"Content-Type" => "application/json"})

      client = Client.new(session)

      error = assert_raises(RuntimeError) do
        client.create_reply("https://bsky.app/profile/test.bsky.social/post/reply456", "Reply to reply")
      end
      assert_match(/Failed to fetch root post/, error.message)
    end
  end
end
