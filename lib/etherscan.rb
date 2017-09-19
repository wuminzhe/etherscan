require 'rest-client'
require 'logger'
require 'etherscanio/call'
require 'etherscanio/api'

module Etherscan
  class << self
    attr_accessor :logger
  end
end