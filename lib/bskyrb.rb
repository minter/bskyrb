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

    def logger
      @logger ||= Logger.new($stdout, level: Logger::WARN)
    end
  end
end
