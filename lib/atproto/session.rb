# typed: false

require "atproto/requests"

module ATProto
  class Credentials
    attr_reader :username, :pw, :pds

    def initialize(username, pw, pds = "https://bsky.social")
      @username = username
      @pw = pw
      @pds = pds # credentials are pds-specific
    end
  end

  class Session
    include RequestUtils

    attr_reader :credentials, :pds, :access_token, :refresh_token, :did, :service_endpoint

    def initialize(credentials, should_open = true)
      @credentials = credentials
      @pds = credentials.pds
      open! if should_open
    end

    def open!
      response = HTTParty.post(
        URI(create_session_uri(pds)),
        body: {identifier: credentials.username, password: credentials.pw}.to_json,
        headers: default_headers
      )

      raise UnauthorizedError if response.code == 401

      @access_token = response["accessJwt"]
      @refresh_token = response["refreshJwt"]
      @did = response["did"]
      @service_endpoint = service_endpoint_for(response["didDoc"])
    end

    def refresh!
      response = HTTParty.post(
        URI(refresh_session_uri(pds)),
        headers: refresh_token_headers(self)
      )
      raise UnauthorizedError if response.code == 401
      @access_token = response["accessJwt"]
      @refresh_token = response["refreshJwt"]
    end

    def get_session
      HTTParty.get(
        URI(get_session_uri(pds)),
        headers: default_authenticated_headers(self)
      )
    end

    def delete!
      response = HTTParty.post(
        URI(delete_session_uri(pds)),
        headers: refresh_token_headers(self)
      )
      if response.code == 200
        {success: true}
      else
        raise UnauthorizedError
      end
    end

    private

    def service_endpoint_for(did_doc)
      endpoint = did_doc_service_endpoint(did_doc) || did_doc_service_endpoint(resolve_did_doc)
      endpoint_host = endpoint && URI.parse(endpoint).host
      "did:web:#{endpoint_host || URI.parse(pds).host}"
    rescue URI::InvalidURIError
      "did:web:#{URI.parse(pds).host}"
    end

    def did_doc_service_endpoint(did_doc)
      services = Array(did_doc&.dig("service")).select { |service| service.is_a?(Hash) }
      service = services.find { |item| atproto_pds_service?(item) } || services.first
      service&.dig("serviceEndpoint")
    end

    def atproto_pds_service?(service)
      service["id"].to_s.end_with?("#atproto_pds") || service["type"] == "AtprotoPersonalDataServer"
    end

    def resolve_did_doc
      return nil unless did

      response = HTTParty.get(
        URI(resolve_did_uri(pds, did)),
        headers: default_headers
      )
      response["didDoc"] if response&.success? && response["didDoc"]
    rescue
      nil
    end
  end
end
