require 'rest-client'
require 'logger'
require 'etherscan/call'
require 'etherscan/api'

module Etherscan
  class << self
    attr_accessor :logger
  end
end