module Etherscanio
  class Api
    def initialize(_key)
      nil
    end

    def account_txlist(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
      call = Etherscanio::Call.new('account', 'txlist')
      call.address = address
      call.startblock = startblock
      call.endblock = endblock
      call.page = page
      call.offset = offset
      call.sort = sort
      call.fetch
    end

    def account_txlistinternal(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
      call = Etherscanio::Call.new('account', 'txlistinternal')
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

    def getminedblocks(address, blocktype, page = nil, offset = nil)
      call = Etherscanio::Call.new('account', 'getminedblocks')
      call.page = page
      call.offset = offset
      call.address = address
      call.blocktype = blocktype
      call.fetch
    end

    def account_balancemulti(address, tag)
      call = Etherscanio::Call.new('account', 'balancemulti')
      call.address = address
      call.tag = tag
      call.fetch
    end

    def contract_getabi(address)
      call = Etherscanio::Call.new('contract', 'getabi')
      call.address = address
      call.fetch
    end

    def transaction_getstatus(txhash)
      call = Etherscanio::Call.new('transaction', 'getstatus')
      call.txhash = txhash
      call.fetch
    end

  end
end
