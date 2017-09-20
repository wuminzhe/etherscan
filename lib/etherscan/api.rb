module Etherscan
  class << self
    attr_accessor :api_key, :chain
  end

  module Account
    class << self
      def txlist(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
        call = Etherscan::Call.new(Etherscan.chain, 'account', 'txlist')
        call.api_key = Etherscan.api_key
        call.address = address
        call.startblock = startblock
        call.endblock = endblock
        call.page = page
        call.offset = offset
        call.sort = sort
        call.fetch
      end
  
      def txlistinternal(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
        call = Etherscan::Call.new(Etherscan.chain, 'account', 'txlistinternal')
        call.api_key = Etherscan.api_key
        call.address = address
        call.startblock = startblock
        call.endblock = endblock
        call.page = page
        call.offset = offset
        call.sort = sort
        call.fetch
      end
  
      def txlistinternal_txhash(txhash)
        call = Etherscan::Call.new(Etherscan.chain, 'account', 'txlistinternal')
        call.api_key = Etherscan.api_key
        call.txhash = txhash
        call.fetch
      end
  
      def balance(address, tag)
        call = Etherscan::Call.new(Etherscan.chain, 'account', 'balance')
        call.api_key = Etherscan.api_key
        call.address = address
        call.tag = tag
        call.fetch
      end
  
      def getminedblocks(address, blocktype, page = nil, offset = nil)
        call = Etherscan::Call.new(Etherscan.chain, 'account', 'getminedblocks')
        call.api_key = Etherscan.api_key
        call.page = page
        call.offset = offset
        call.address = address
        call.blocktype = blocktype
        call.fetch
      end
  
      def balancemulti(address, tag)
        call = Etherscan::Call.new(Etherscan.chain, 'account', 'balancemulti')
        call.api_key = Etherscan.api_key
        call.address = address
        call.tag = tag
        call.fetch
      end
    end
  end

  module Contract
    class << self
      def getabi(address)
        call = Etherscan::Call.new(Etherscan.chain, 'contract', 'getabi')
        call.api_key = Etherscan.api_key
        call.address = address
        call.fetch
      end
    end
  end

  module Transaction
    class << self
      def getstatus(txhash)
        call = Etherscan::Call.new(Etherscan.chain, 'transaction', 'getstatus')
        call.api_key = Etherscan.api_key
        call.txhash = txhash
        call.fetch
      end
    end
  end

  module Block
    class << self
      def getblockreward(blockno)
        call = Etherscan::Call.new(Etherscan.chain, 'block', 'getblockreward')
        call.api_key = Etherscan.api_key
        call.blockno = blockno
        call.fetch
      end
    end
  end

  module Logs
    class << self
      def get_logs(fromBlock, toBlock, address, topics)
        call = Etherscan::Call.new(Etherscan.chain, 'logs', 'getLogs')
        call.api_key = Etherscan.api_key
        call.fromBlock = fromBlock
        call.toBlock = toBlock
        call.address = address
        call.topics = topics
        call.fetch
      end
    end
  end

  module Proxy
    class << self
      def eth_block_number
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_blockNumber')
        call.api_key = Etherscan.api_key
        call.fetch
      end

      def eth_get_block_by_number(tag, boolean)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_getBlockByNumber')
        call.api_key = Etherscan.api_key
        call.tag = tag
        call.boolean = boolean
        call.fetch
      end

      def eth_get_transaction_by_hash(txhash)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_getTransactionByHash')
        call.api_key = Etherscan.api_key
        call.txhash = txhash
        call.fetch
      end

      def eth_get_uncle_by_block_number_and_index(tag, index)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_getUncleByBlockNumberAndIndex')
        call.api_key = Etherscan.api_key
        call.tag = tag
        call.index = index
        call.fetch
      end

      def eth_get_block_transaction_count_by_number(tag)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_getBlockTransactionCountByNumber')
        call.api_key = Etherscan.api_key
        call.tag = tag
        call.fetch
      end

      def eth_get_transaction_by_block_number_and_index(tag, index)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_getTransactionByBlockNumberAndIndex')
        call.api_key = Etherscan.api_key
        call.tag = tag
        call.index = index
        call.fetch
      end

      def eth_get_transaction_count(address, tag)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_getTransactionCount')
        call.api_key = Etherscan.api_key
        call.address = address
        call.tag = tag
        call.fetch
      end

      def eth_send_raw_transaction(hex)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_sendRawTransaction')
        call.api_key = Etherscan.api_key
        call.hex = hex
        call.fetch
      end

      def eth_get_transaction_receipt(txhash)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_getTransactionReceipt')
        call.api_key = Etherscan.api_key
        call.txhash = txhash
        call.fetch
      end

      def eth_call(to, data, tag)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_call')
        call.api_key = Etherscan.api_key
        call.to = to
        call.data = data
        call.tag = tag
        call.fetch
      end

      def eth_get_code(address, tag)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_getCode')
        call.api_key = Etherscan.api_key
        call.address = address
        call.tag = tag
        call.fetch
      end

      def eth_get_storage_at(address, position, tag)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_getStorageAt')
        call.api_key = Etherscan.api_key
        call.address = address
        call.position = position
        call.tag = tag
        call.fetch
      end

      def eth_gas_price
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_gasPrice')
        call.api_key = Etherscan.api_key
        call.fetch
      end

      def eth_estimate_gas(to, value, gas_price, gas)
        call = Etherscan::Call.new(Etherscan.chain, 'proxy', 'eth_estimateGas')
        call.api_key = Etherscan.api_key
        call.to = to
        call.value = value
        call.gasPrice = gas_price
        call.gas = gas
        call.fetch
      end
    end
  end
end
