module Etherscanio
  class Api
    def initialize(_key)
      nil
    end

    def txlist(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
      call = Etherscanio::Call.new('account', 'txlist')
      call.address = address
      call.startblock = startblock
      call.endblock = endblock
      call.page = page
      call.offset = offset
      call.sort = sort
      call.fetch
    end

    def account_balance(address, tag)
      call = Etherscanio::Call.new('account', 'balance')
      call.address = address
      call.tag = tag
      call.fetch
    end

    def account_balancemulti(address, tag)
      call = Etherscanio::Call.new('account', 'balancemulti')
      call.address = address
      call.tag = tag
      call.fetch
    end
  end
end
