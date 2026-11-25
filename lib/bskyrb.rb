# typed: strict
# frozen_string_literal: true

require "logger"
require "bskyrb/error"
require "atproto/session"
require "bskyrb/records"
require "bskyrb/generated_classes"
require "xrpc"

module Bskyrb
  class << self
    attr_writer :logger

    # Proxy for fetching link previews and remote images, e.g.
    # "http://egress.internal:3128". Off by default: environment proxy settings
    # are ignored so every request goes to the address that passed the
    # public-address check. A proxy does its own DNS lookup, so only set this
    # if the proxy itself blocks private, loopback and link-local destinations.
    attr_accessor :remote_fetch_proxy

    def logger
      @logger ||= Logger.new($stdout, level: Logger::WARN)
    end
  end
end
