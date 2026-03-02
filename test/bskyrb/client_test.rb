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
  end
end
