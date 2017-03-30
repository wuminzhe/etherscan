require 'rest-client'
module Etherscanio
  class Call
    attr_accessor :mod,
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
                  :blocktype
    def initialize(mod, action)
      @base = 'http://api.etherscan.io/api?'
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
      uri += '&address=' + address if address
      uri += '&startblock=' + startblock.to_s if startblock
      uri += '&endblock=' + endblock.to_s if endblock
      uri += '&sort=' + sort if sort
      uri += '&page=' + page.to_s if page
      uri += '&tag=' + tag if tag
      @base + uri
    end
  end
end
