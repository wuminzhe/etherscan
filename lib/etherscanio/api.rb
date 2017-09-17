module Etherscanio
  class Api
    def initialize(api_key, chain)
      @api_key = api_key
      @chain = chain
    end

    def account_txlist(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
      call = Etherscanio::Call.new(@chain, 'account', 'txlist')
      call.api_key = @api_key
      call.address = address
      call.startblock = startblock
      call.endblock = endblock
      call.page = page
      call.offset = offset
      call.sort = sort
      call.fetch
    end

    def account_txlistinternal(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
      call = Etherscanio::Call.new(@chain, 'account', 'txlistinternal')
      call.api_key = @api_key
      call.address = address
      call.startblock = startblock
      call.endblock = endblock
      call.page = page
      call.offset = offset
      call.sort = sort
      call.fetch
    end

    def account_balance(address, tag)
      call = Etherscanio::Call.new(@chain, 'account', 'balance')
      call.api_key = @api_key
      call.address = address
      call.tag = tag
      call.fetch
    end

    def account_getminedblocks(address, blocktype, page = nil, offset = nil)
      call = Etherscanio::Call.new(@chain, 'account', 'getminedblocks')
      call.api_key = @api_key
      call.page = page
      call.offset = offset
      call.address = address
      call.blocktype = blocktype
      call.fetch
    end

    def account_balancemulti(address, tag)
      call = Etherscanio::Call.new(@chain, 'account', 'balancemulti')
      call.api_key = @api_key
      call.address = address
      call.tag = tag
      call.fetch
    end

    def contract_getabi(address)
      call = Etherscanio::Call.new(@chain, 'contract', 'getabi')
      call.api_key = @api_key
      call.address = address
      call.fetch
    end

    def transaction_getstatus(txhash)
      call = Etherscanio::Call.new(@chain, 'transaction', 'getstatus')
      call.api_key = @api_key
      call.txhash = txhash
      call.fetch
    end

    def block_getblockreward(blockno)
      call = Etherscanio::Call.new(@chain, 'block', 'getblockreward')
      call.api_key = @api_key
      call.blockno = blockno
      call.fetch
    end

    def eth_getTransactionCount(address, tag)
      call = Etherscanio::Call.new(@chain, 'proxy', 'eth_getTransactionCount')
      call.api_key = @api_key
      call.address = address
      call.tag = tag
      call.fetch
    end
    
    def eth_sendRawTransaction(hex)
      call = Etherscanio::Call.new(@chain, 'proxy', 'eth_sendRawTransaction')
      call.api_key = @api_key
      call.hex = hex
      call.fetch
    end

  end
end
