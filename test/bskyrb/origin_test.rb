# typed: true
# frozen_string_literal: true

require "test_helper"

module ATProto
  class OriginTest < Minitest::Test
    def test_normalize_preserves_https_host_and_port
      assert_equal "https://pds.example:8443", Origin.normalize("HTTPS://pds.example:8443/")
    end

    def test_normalize_rejects_values_that_are_not_https_origins
      invalid_origins = [
        "http://pds.example",
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
