# typed: true
# frozen_string_literal: true

require "test_helper"

module ATProto
  class OriginTest < Minitest::Test
    def test_normalize_preserves_https_host_and_port
      assert_equal "https://pds.example:8443", Origin.normalize("HTTPS://pds.example:8443/")
    end

    def test_normalize_lowercases_host
      assert_equal "https://pds.example", Origin.normalize("https://PDS.Example")
    end

    def test_normalize_allows_cleartext_http_only_for_loopback
      assert_equal "http://localhost:2583", Origin.normalize("http://localhost:2583")
      assert_equal "http://127.0.0.1:2583", Origin.normalize("http://127.0.0.1:2583/")
      assert_raises(ArgumentError) { Origin.normalize("http://localhost.evil.example") }
    end

    def test_error_names_the_problem
      error = assert_raises(ArgumentError) { Origin.normalize("https://pds.example/xrpc") }
      assert_match(/path is not allowed/, error.message)
    end

    def test_normalize_rejects_values_that_are_not_https_origins
      invalid_origins = [
        "http://pds.example",
        "ftp://localhost",
        "//pds.example",
        "https://",
        "https://user:password@pds.example",
        "https://pds.example/xrpc",
        "https://pds.example?tenant=other",
        "https://pds.example#fragment",
        "not a URI",
        nil
      ]

      invalid_origins.each do |origin|
        assert_raises(ArgumentError) { Origin.normalize(origin) }
      end
    end
  end
end
