# typed: true
# frozen_string_literal: true

require "test_helper"

module Bskyrb
  class SessionTest < Minitest::Test
    def test_create_session_with_valid_credentials_returns_an_open_session
      stub_request(:post, "https://bsky.social/xrpc/com.atproto.server.createSession").to_return(
        status: 200,
        headers: {"Content-Type" => "application/json"},
        body: {
          "accessJwt" => "ACCESS_JWT",
          "refreshJwt" => "REFRESH_JWT",
          "did" => "DID",
          "didDoc" => {
            "service" => [
              {"serviceEndpoint" => "https://morel.us-east.host.bsky.network"}
            ]
          }
        }.to_json
      )

      credentials = ATProto::Credentials.new(ENV["BSKY_USERNAME"], ENV["BSKY_PASSWORD"])

      session = ATProto::Session.new(credentials)

      assert_equal "ACCESS_JWT", session.access_token

      assert_equal "REFRESH_JWT", session.refresh_token

      assert_equal "DID", session.did

      assert_equal "did:web:morel.us-east.host.bsky.network", session.service_endpoint
    end

    def test_create_session_resolves_did_doc_when_response_omits_it
      stub_request(:post, "https://bsky.social/xrpc/com.atproto.server.createSession").to_return(
        status: 200,
        headers: {"Content-Type" => "application/json"},
        body: {
          "accessJwt" => "ACCESS_JWT",
          "refreshJwt" => "REFRESH_JWT",
          "did" => "did:plc:testuser123"
        }.to_json
      )

      resolve_stub = stub_request(:get, "https://bsky.social/xrpc/com.atproto.identity.resolveDid?did=did%3Aplc%3Atestuser123").to_return(
        status: 200,
        headers: {"Content-Type" => "application/json"},
        body: {
          "didDoc" => {
            "service" => [
              {"serviceEndpoint" => "https://morel.us-east.host.bsky.network"}
            ]
          }
        }.to_json
      )

      credentials = ATProto::Credentials.new("test.bsky.social", "password")

      session = ATProto::Session.new(credentials)

      assert_requested resolve_stub
      assert_equal "did:web:morel.us-east.host.bsky.network", session.service_endpoint
    end

    def test_create_session_uses_atproto_pds_service_when_did_doc_has_multiple_services
      stub_request(:post, "https://bsky.social/xrpc/com.atproto.server.createSession").to_return(
        status: 200,
        headers: {"Content-Type" => "application/json"},
        body: {
          "accessJwt" => "ACCESS_JWT",
          "refreshJwt" => "REFRESH_JWT",
          "did" => "did:plc:testuser123",
          "didDoc" => {
            "service" => [
              {
                "id" => "#not_pds",
                "type" => "ExampleService",
                "serviceEndpoint" => "https://example.com"
              },
              {
                "id" => "#atproto_pds",
                "type" => "AtprotoPersonalDataServer",
                "serviceEndpoint" => "https://morel.us-east.host.bsky.network"
              }
            ]
          }
        }.to_json
      )

      credentials = ATProto::Credentials.new("test.bsky.social", "password")

      session = ATProto::Session.new(credentials)

      assert_equal "did:web:morel.us-east.host.bsky.network", session.service_endpoint
    end

    def test_create_session_falls_back_to_pds_host_when_did_doc_cannot_be_resolved
      stub_request(:post, "https://example-pds.test/xrpc/com.atproto.server.createSession").to_return(
        status: 200,
        headers: {"Content-Type" => "application/json"},
        body: {
          "accessJwt" => "ACCESS_JWT",
          "refreshJwt" => "REFRESH_JWT",
          "did" => "did:plc:testuser123"
        }.to_json
      )

      stub_request(:get, "https://example-pds.test/xrpc/com.atproto.identity.resolveDid?did=did%3Aplc%3Atestuser123").to_return(
        status: 404,
        headers: {"Content-Type" => "application/json"},
        body: {"error" => "NotFound"}.to_json
      )

      credentials = ATProto::Credentials.new("test.bsky.social", "password", "https://example-pds.test")

      session = ATProto::Session.new(credentials)

      assert_equal "did:web:example-pds.test", session.service_endpoint
    end

    def test_create_session_with_invalid_credentials_raises_unauthorized_error
      stub_request(:post, "https://bsky.social/xrpc/com.atproto.server.createSession").to_return(status: 401)

      credentials = ATProto::Credentials.new("invalid_username", "invalid_password", "https://bsky.social")

      assert_raises(ATProto::UnauthorizedError) do
        ATProto::Session.new(credentials)
      end
    end
  end
end
