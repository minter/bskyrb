# typed: false
# frozen_string_literal: true

require "uri"

module ATProto
  module Origin
    INVALID_ORIGIN_MESSAGE = "origin must be an absolute HTTPS URL without userinfo, path, query, or fragment"

    def self.normalize(value)
      raise ArgumentError, INVALID_ORIGIN_MESSAGE unless value.is_a?(String)

      uri = URI.parse(value)
      root_path = uri.path.nil? || uri.path.empty? || uri.path == "/"
      secure = uri.scheme.to_s.downcase == "https"
      valid_host = !uri.host.nil? && !uri.host.empty?

      unless secure && valid_host && uri.userinfo.nil? && root_path && uri.query.nil? && uri.fragment.nil?
        raise ArgumentError, INVALID_ORIGIN_MESSAGE
      end

      uri.scheme = "https"
      uri.path = ""
      uri.to_s.freeze
    rescue URI::InvalidURIError, TypeError
      raise ArgumentError, INVALID_ORIGIN_MESSAGE
    end
  end
end
