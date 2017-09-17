require 'rest-client'
module Etherscanio
  class Call
    attr_accessor :chain,
                  :mod,
                  :action,
                  :api_key,
                  :address,
                  :tag,
                  :startblock,
                  :endblock,
                  :sort,
                  :page,
                  :offset,
                  :sort,
                  :blocktype,
                  :txhash,
                  :blockno
                  :hex

    CHAINS = {
      mainnet: 'http://api.etherscan.io/api?',
      ropsten: 'https://ropsten.etherscan.io/api?',
      kovan: 'https://kovan.etherscan.io/api?',
      rinkeby: 'https://rinkeby.etherscan.io/api?'
    }

    def initialize(chain, mod, action)
      @chain = chain.to_sym
      @base = CHAINS[chain.to_sym]
      @mod = mod
      @action = action
      @api_key = false
    end

    def fetch
      res = RestClient.get(to_s, {}).body
      parsed = JSON.parse(res)
      JSON.generate(parsed)
    end

    def to_s
      uri = 'module=' + mod + '&action=' + action
      uri += '&apikey=' + api_key if api_key
      uri += address_fragment
      uri += '&startblock=' + startblock.to_s if startblock
      uri += '&endblock=' + endblock.to_s if endblock
      uri += '&blocktype=' + blocktype if blocktype
      uri += '&txhash=' + txhash if txhash
      uri += '&blockno=' + blockno.to_s if blockno
      uri += '&offset=' + offset.to_s if offset
      uri += '&sort=' + sort if sort
      uri += '&page=' + page.to_s if page
      uri += '&tag=' + tag if tag
      uri += '&hex=' + hex if hex
      @base + uri
    end

    private

    def address_fragment
      res = ''
      res += '&address=' + address if (address && !address.is_a?(Array))
      res += '&address=' + address.join(',') if (address && address.is_a?(Array))
      res
    end
  end
end
