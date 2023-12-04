require 'json'
require 'logger'
require 'net/http'
require 'etherscan/api'
require 'tronscan/api'
require 'subscan/api'

require 'active_support'
require 'active_support/core_ext/string'

module Etherscan
  # https://chainid.network/chains.json
  # key is the underscore(short name) of the chain in chains.json
  # https://blockscan.com/
  CHAINS = {
    'eth' => 'http://api.etherscan.io/api',
    'gor' => 'https://api-goerli.etherscan.io/api',
    'sep' => 'https://api-sepolia.etherscan.io/api',
    'arb1' => 'https://api.arbiscan.io/api',
    'arb_goerli' => 'https://api-goerli.arbiscan.io/api',
    'arb_sep' => 'https://api-sepolia.arbiscan.io/api',
    'bnb' => 'https://api.bscscan.com/api',
    'bnbt' => 'https://api-testnet.bscscan.com/api',
    'matic' => 'https://api.polygonscan.com/api',
    'maticmum' => 'https://api-testnet.polygonscan.com/api',
    'zkevm' => 'https://api-zkevm.polygonscan.com/api',
    'testnet_zk_evm_mango' => 'https://api-testnet-zkevm.polygonscan.com/api',
    'ftm' => 'https://api.ftmscan.com/api',
    'tftm' => 'https://api-testnet.ftmscan.com/api',
    'oeth' => 'https://api-optimistic.etherscan.io/api',
    'mbeam' => 'https://api-moonbeam.moonscan.io/api',
    'mriver' => 'https://api-moonriver.moonscan.io/api',
    'mbase' => 'https://api-moonbase.moonscan.io/api',
    'cronos' => 'https://api.cronoscan.com/api',
    'btt' => 'https://api.bttcscan.com/api',
    'tbtt' => 'https://api-testnet.bttcscan.com/api',
    'gnosis' => 'https://api.gnosisscan.io/api',
    'arb_nova' => 'https://api-nova.arbiscan.io/api',
    # 'celo' => 'https://api.celoscan.io',
    # 'alfa' => 'https://api-alfajores.celoscan.io',
    'linea' => 'https://api.lineascan.build/api',
    'linea_testnet' => 'https://api-testnet.lineascan.build/api',
    'base' => 'https://api.basescan.org/api',
    'basegor' => 'https://api-goerli.basescan.org/api',
    'wemix' => 'https://api.wemixscan.com/api',
    'scr' => 'https://api.scrollscan.com/api',
    'scr_sepolia' => 'https://api-sepolia.scrollscan.com/api',
    'obnb' => 'https://api-opbnb.bscscan.com/api'
  }

  # https://tronscan.org/#/developer/api
  TRON_CHAINS = {
    'tron' => 'https://apilist.tronscanapi.com/api',
  }

  SUBSCAN_CHAINS = {
    'pangolin' => 'https://pangolin.api.subscan.io/api',
    'crab' => 'https://crab.api.subscan.io/api',
    'darwinia' => 'https://darwinia.api.subscan.io/api',
  }

  class << self
    attr_accessor :logger

    def api(chain_short_name, api_key = nil)
      url = CHAINS[chain_short_name]
      url = CHAINS[chain_short_name.underscore] if url.nil?

      tron_url = TRON_CHAINS[chain_short_name]
      tron_url = TRON_CHAINS[chain_short_name.underscore] if url.nil?

      subscan_url = SUBSCAN_CHAINS[chain_short_name]
      subscan_url = SUBSCAN_CHAINS[chain_short_name.underscore] if url.nil?

      raise "Chain `#{chain_short_name}` is not supported. Only " \
            "Etherscan [#{CHAINS.keys}] & " \
            "Subscan [#{SUBSCAN_CHAINS.keys}] & " \
            "Tronscan [#{TRON_CHAINS.keys}] are supported." if url.nil? && tron_url.nil? && subscan_url.nil?

      return Etherscan::Api.new(url, api_key) if url
      return Tronscan::Api.new(tron_url, api_key) if tron_url
      return Subscan::Api.new(subscan_url, api_key) if subscan_url
    end

    # for example: Etherscan.eth('your_api_key')
    # just a wrap of Etherscan.api('eth', 'your_api_key')
    def method_missing(method, *args)
      chain_short_name = method.to_s.downcase
      api_key = args[0]

      api(chain_short_name, api_key)
    end

    def respond_to_missing?(*_args)
      true
    end

    def test_all
      CHAINS.reverse_each do |chain_short_name, url|
        api = Etherscan::Api.new(url)
        address = '0x0000000000000000000000000000000000000000'
        balance = api.account_balance(address: address)
        puts "#{chain_short_name} 0x0 balance: #{balance}"
      end
    end
  end
end

Etherscan.logger = Logger.new($stdout)
Etherscan.logger.level = Logger::INFO
