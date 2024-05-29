require 'json'
require 'logger'
require 'net/http'
require 'etherscan/api'
require 'tronscan/api'
require 'subscan/api'

require 'active_support'
require 'active_support/core_ext/string'

module Etherscan
  CHAIN_SHORT_NAME_BY_ID = {
    1 => 'eth',
    5 => 'gor',
    11_155_111 => 'sep',
    42_161 => 'arb1',
    421_613 => 'arb_goerli',
    421_614 => 'arb_sep',
    56 => 'bnb',
    97 => 'bnbt',
    137 => 'matic',
    80_001 => 'maticmum',
    1101 => 'zkevm',
    14_422 => 'testnet_zk_evm_mango',
    250 => 'ftm',
    4002 => 'tftm',
    10 => 'oeth',
    1284 => 'mbeam',
    1285 => 'mriver',
    1287 => 'mbase',
    25 => 'cronos',
    199 => 'btt',
    1028 => 'tbtt',
    100 => 'gnosis',
    42_170 => 'arb_nova',
    59_144 => 'linea',
    59_140 => 'linea_testnet',
    8453 => 'base',
    84_531 => 'basegor',
    1111 => 'wemix',
    534_352 => 'scr',
    534_351 => 'scr_sepolia',
    204 => 'obnb',
    81457 => 'blastmainnet',
    167009 => 'tko_hekla',

    728_126_428 => 'tron',
    2_494_104_990 => 'tron_shasta',
    43 => 'pangolin',
    44 => 'crab',
    46 => 'darwinia',
    45 => 'tanssi_pangoro'
  }

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
    'obnb' => 'https://api-opbnb.bscscan.com/api',
    'blastmainnet' => 'https://blast.blockscout.com/api',
    'tko-hekla' => 'https://api.routescan.io/v2/network/testnet/evm/167009/etherscan/api'
  }

  # https://tronscan.org/#/developer/api
  TRON_CHAINS = {
    'tron' => 'https://apilist.tronscanapi.com/api',
    'tron_shasta' => 'https://shastapi.tronscan.org/api'
  }

  SUBSCAN_CHAINS = {
    'pangolin' => 'https://pangolin.api.subscan.io/api',
    'crab' => 'https://crab.api.subscan.io/api',
    'darwinia' => 'https://darwinia.api.subscan.io/api'
  }

  class << self
    attr_accessor :logger

    def api(chain_id_or_short_name, api_key = nil)
      if chain_id_or_short_name.is_a?(Integer)
        chain_short_name = CHAIN_SHORT_NAME_BY_ID[chain_id_or_short_name]
        raise "Chain id `#{chain_id_or_short_name}` is not supported." if chain_short_name.nil?
      else
        chain_short_name = chain_id_or_short_name
      end

      url = CHAINS[chain_short_name]
      url = CHAINS[chain_short_name.underscore] if url.nil?

      tron_url = TRON_CHAINS[chain_short_name]
      tron_url = TRON_CHAINS[chain_short_name.underscore] if url.nil?

      subscan_url = SUBSCAN_CHAINS[chain_short_name]
      subscan_url = SUBSCAN_CHAINS[chain_short_name.underscore] if url.nil?

      if url.nil? && tron_url.nil? && subscan_url.nil?
        raise "Chain `#{chain_short_name}` is not supported. Only " \
              "ETHERSCAN #{CHAINS.keys} & " \
              "SUBSCAN #{SUBSCAN_CHAINS.keys} & " \
              "TRONSCAN #{TRON_CHAINS.keys} are supported."
      end

      return Etherscan::Api.new(url, api_key) if url
      return Tronscan::Api.new(tron_url, api_key) if tron_url

      Subscan::Api.new(subscan_url, api_key) if subscan_url
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
