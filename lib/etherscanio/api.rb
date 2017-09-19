module Etherscanio
  class << self
    attr_accessor :api_key, :chain
  end

  module Account
    class << self
      def txlist(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
        call = Etherscanio::Call.new(Etherscanio.chain, 'account', 'txlist')
        call.api_key = Etherscanio.api_key
        call.address = address
        call.startblock = startblock
        call.endblock = endblock
        call.page = page
        call.offset = offset
        call.sort = sort
        call.fetch
      end
  
      def txlistinternal(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
        call = Etherscanio::Call.new(Etherscanio.chain, 'account', 'txlistinternal')
        call.api_key = Etherscanio.api_key
        call.address = address
        call.startblock = startblock
        call.endblock = endblock
        call.page = page
        call.offset = offset
        call.sort = sort
        call.fetch
      end
  
      def txlistinternal_txhash(txhash)
        call = Etherscanio::Call.new(Etherscanio.chain, 'account', 'txlistinternal')
        call.api_key = Etherscanio.api_key
        call.txhash = txhash
        call.fetch
      end
  
      def balance(address, tag)
        call = Etherscanio::Call.new(Etherscanio.chain, 'account', 'balance')
        call.api_key = Etherscanio.api_key
        call.address = address
        call.tag = tag
        call.fetch
      end
  
      def getminedblocks(address, blocktype, page = nil, offset = nil)
        call = Etherscanio::Call.new(Etherscanio.chain, 'account', 'getminedblocks')
        call.api_key = Etherscanio.api_key
        call.page = page
        call.offset = offset
        call.address = address
        call.blocktype = blocktype
        call.fetch
      end
  
      def balancemulti(address, tag)
        call = Etherscanio::Call.new(Etherscanio.chain, 'account', 'balancemulti')
        call.api_key = Etherscanio.api_key
        call.address = address
        call.tag = tag
        call.fetch
      end
    end
  end

  module Contract
    class << self
      def getabi(address)
        call = Etherscanio::Call.new(Etherscanio.chain, 'contract', 'getabi')
        call.api_key = Etherscanio.api_key
        call.address = address
        call.fetch
      end
    end
  end

  module Transaction
    class << self
      def getstatus(txhash)
        call = Etherscanio::Call.new(Etherscanio.chain, 'transaction', 'getstatus')
        call.api_key = Etherscanio.api_key
        call.txhash = txhash
        call.fetch
      end
    end
  end

  module Block
    class << self
      def getblockreward(blockno)
        call = Etherscanio::Call.new(Etherscanio.chain, 'block', 'getblockreward')
        call.api_key = Etherscanio.api_key
        call.blockno = blockno
        call.fetch
      end
    end
  end

  module Proxy
    class << self
      def eth_block_number
        call = Etherscanio::Call.new(Etherscanio.chain, 'proxy', 'eth_blockNumber')
        call.api_key = Etherscanio.api_key
        call.fetch
      end

      def eth_get_block_by_number(tag, boolean)
        call = Etherscanio::Call.new(Etherscanio.chain, 'proxy', 'eth_getBlockByNumber')
        call.api_key = Etherscanio.api_key
        call.tag = tag
        call.boolean = boolean
        call.fetch
      end

      def eth_send_raw_transaction(hex)
        call = Etherscanio::Call.new(Etherscanio.chain, 'proxy', 'eth_sendRawTransaction')
        call.api_key = Etherscanio.api_key
        call.hex = hex
        call.fetch
      end

      def eth_get_transaction_count(address, tag)
        call = Etherscanio::Call.new(Etherscanio.chain, 'proxy', 'eth_getTransactionCount')
        call.api_key = Etherscanio.api_key
        call.address = address
        call.tag = tag
        call.fetch
      end

      def eth_get_transaction_by_hash(txhash)
        call = Etherscanio::Call.new(Etherscanio.chain, 'proxy', 'eth_getTransactionByHash')
        call.api_key = Etherscanio.api_key
        call.txhash = txhash
        call.fetch
      end
    end
  end
end
