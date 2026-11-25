# typed: false
# frozen_string_literal: true

require "uri"

module ATProto
  module Origin
    INVALID_ORIGIN_MESSAGE = "origin must be an absolute HTTPS URL without userinfo, path, query, or fragment"
    LOOPBACK_HOSTS = %w[localhost 127.0.0.1 [::1]].freeze

    # Validates and canonicalizes a server origin. HTTPS is required, except
    # that cleartext HTTP is accepted for loopback hosts (local development
    # PDS). The scheme and host are lowercased; the result is frozen.
    def self.normalize(value)
      raise ArgumentError, "#{INVALID_ORIGIN_MESSAGE} (got #{value.class}, expected String)" unless value.is_a?(String)

      uri = URI.parse(value)
      host = uri.host.to_s.downcase
      scheme = uri.scheme.to_s.downcase

      problem = if host.empty?
        "missing host"
      elsif scheme != "https" && !(scheme == "http" && LOOPBACK_HOSTS.include?(host))
        "scheme must be https (http is allowed only for localhost, 127.0.0.1 or [::1])"
      elsif !uri.userinfo.nil?
        "userinfo is not allowed"
      elsif !(uri.path.nil? || uri.path.empty? || uri.path == "/")
        "path is not allowed"
      elsif !uri.query.nil?
        "query is not allowed"
      elsif !uri.fragment.nil?
        "fragment is not allowed"
      end
      raise ArgumentError, "#{INVALID_ORIGIN_MESSAGE}: #{problem} in #{value.inspect}" if problem

      uri.scheme = scheme
      uri.host = host
      uri.path = ""
      uri.to_s.freeze
    rescue URI::InvalidURIError, TypeError
      raise ArgumentError, INVALID_ORIGIN_MESSAGE
    end
  end
end
