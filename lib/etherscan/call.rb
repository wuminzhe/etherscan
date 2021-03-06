module Etherscan
  class ReturnError < RuntimeError; end

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
                  :blockno,
                  :hex,
                  :boolean,
                  :data,
                  :to,
                  :index,
                  :position,
                  :gasPrice,
                  :gas,
                  :fromBlock,
                  :toBlock,
                  :address,
                  :topics

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
      query_url = to_s
      Etherscan.logger.debug query_url
      res = Faraday.get(query_url).body
      Etherscan.logger.debug res
      data = JSON.parse(res)
      return [:error, data['error']] if data['error']
      return [:error, data['message']] if (data['status'] && data['status'] != '1')
      return [:ok, data['result']]
    rescue => e
      Etherscan.logger.error "Error: #{e}"
      Etherscan.logger.error e.backtrace[0, 20].join("\n")
      return [:error, e.message]
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
      uri += '&boolean=' + boolean if boolean
      uri += '&data=' + data if data
      uri += '&to=' + to if to
      uri += '&index=' + index if index
      uri += '&position=' + position if position
      uri += '&gasPrice=' + gasPrice if gasPrice
      uri += '&fromBlock=' + fromBlock if fromBlock
      uri += '&toBlock=' + toBlock if toBlock
      if topics
        topics.each do |topic|
          uri += "&#{topic['name']}=" + topic['value']
        end
      end
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
