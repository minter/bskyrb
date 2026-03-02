# typed: true
# frozen_string_literal: true

require "test_helper"

module ATProto
  class RequestUtilsTestHarness
    include RequestUtils

    # Stub resolve_handle to avoid network calls
    def resolve_handle(_pds, username)
      {"did" => "did:plc:fake#{username.gsub(".", "")}"}
    end
  end

  class RequestUtilsURIEncodingTest < Minitest::Test
    def setup
      @utils = RequestUtilsTestHarness.new
    end

    def test_upload_video_uri_encodes_filename_with_spaces
      uri = @utils.upload_video_uri("https://video.bsky.app", "did:plc:abc123", "my video.mp4")
      assert_includes uri, "name=my+video.mp4"
    end

    def test_upload_video_uri_encodes_special_characters
      uri = @utils.upload_video_uri("https://video.bsky.app", "did:plc:abc123", "file&name=test.mp4")
      assert_includes uri, "name=file%26name%3Dtest.mp4"
    end

    def test_upload_video_uri_encodes_did
      uri = @utils.upload_video_uri("https://video.bsky.app", "did:plc:abc123", "test.mp4")
      assert_includes uri, "did=did%3Aplc%3Aabc123"
    end

    def test_get_video_job_status_uri_encodes_job_id
      uri = @utils.get_video_job_status_uri("https://video.bsky.app", "job/123&extra")
      assert_includes uri, "jobId=job%2F123%26extra"
    end

    def test_get_service_auth_uri_encodes_params
      uri = @utils.get_service_auth_uri("https://bsky.social", "did:web:example.com", "com.atproto.repo.uploadBlob", "12345")
      assert_includes uri, "aud=did%3Aweb%3Aexample.com"
      assert_includes uri, "lxm=com.atproto.repo.uploadBlob"
      assert_includes uri, "exp=12345"
    end

    def test_get_profile_uri_encodes_username
      uri = @utils.get_profile_uri("https://bsky.social", "user.bsky.social")
      assert_includes uri, "actor=user.bsky.social"
    end

    def test_get_followers_uri_without_cursor
      uri = @utils.get_followers_uri("https://bsky.social", "user.bsky.social", nil)
      assert_equal "https://bsky.social/xrpc/app.bsky.graph.getFollowers?actor=user.bsky.social", uri
      refute_includes uri, "cursor"
    end

    def test_get_followers_uri_with_cursor
      uri = @utils.get_followers_uri("https://bsky.social", "user.bsky.social", "abc123")
      assert_includes uri, "actor=user.bsky.social"
      assert_includes uri, "cursor=abc123"
    end

    def test_get_followers_uri_encodes_cursor_with_special_chars
      uri = @utils.get_followers_uri("https://bsky.social", "user.bsky.social", "cursor+value/123")
      assert_includes uri, "cursor=cursor%2Bvalue%2F123"
    end
  end

  class RequestUtilsAtPostLinkTest < Minitest::Test
    def setup
      @utils = RequestUtilsTestHarness.new
    end

    def test_parses_bsky_app_url
      result = @utils.at_post_link("https://bsky.social", "https://bsky.app/profile/user.bsky.social/post/abc123")
      assert_equal "at://did:plc:fakeuserbskysocial/app.bsky.feed.post/abc123", result
    end

    def test_passes_through_valid_at_uri_with_did
      result = @utils.at_post_link("https://bsky.social", "at://did:plc:abc123/app.bsky.feed.post/xyz789")
      assert_equal "at://did:plc:abc123/app.bsky.feed.post/xyz789", result
    end

    def test_resolves_handle_in_at_uri
      result = @utils.at_post_link("https://bsky.social", "at://user.bsky.social/app.bsky.feed.post/xyz789")
      assert_equal "at://did:plc:fakeuserbskysocial/app.bsky.feed.post/xyz789", result
    end

    def test_raises_on_invalid_url
      assert_raises(RuntimeError) do
        @utils.at_post_link("https://bsky.social", "https://example.com/not/a/post")
      end
    end

    def test_raises_on_invalid_at_uri
      assert_raises(RuntimeError) do
        @utils.at_post_link("https://bsky.social", "at://invalid/uri")
      end
    end
  end

  class RequestUtilsStaticURITest < Minitest::Test
    def setup
      @utils = RequestUtilsTestHarness.new
    end

    def test_create_session_uri
      assert_equal "https://bsky.social/xrpc/com.atproto.server.createSession",
        @utils.create_session_uri("https://bsky.social")
    end

    def test_delete_record_uri
      assert_equal "https://bsky.social/xrpc/com.atproto.repo.deleteRecord",
        @utils.delete_record_uri("https://bsky.social")
    end

    def test_upload_blob_uri
      assert_equal "https://bsky.social/xrpc/com.atproto.repo.uploadBlob",
        @utils.upload_blob_uri("https://bsky.social")
    end

    def test_mute_actor_uri
      assert_equal "https://bsky.social/xrpc/app.bsky.graph.muteActor",
        @utils.mute_actor_uri("https://bsky.social")
    end
  end
end
