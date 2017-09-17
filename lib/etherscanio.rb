require 'rest-client'
require 'logger'
require 'etherscanio/call'
require 'etherscanio/api'

module Etherscanio
  class << self
    attr_accessor :logger
  end
end