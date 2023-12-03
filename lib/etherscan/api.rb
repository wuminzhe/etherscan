module Etherscan
  class Api
    def initialize(url, api_key = nil)
      @url = url
      @api_key = api_key
    end

    def request(module_name, action, params = {})
      params = params.reject { |_k, v| v.nil? } # filter out nil values
      params_query = params.keys.map { |key| "#{key}=#{params[key]}" }.join('&').strip
      params_query = if params_query.empty?
                       ''
                     else
                       "&#{params_query}"
                     end

      api_key_query = @api_key.nil? ? '' : "&apikey=#{@api_key}"

      uri = URI "#{@url}?module=#{module_name}&action=#{action}#{params_query}#{api_key_query}"
      Etherscan.logger.debug "Req: #{uri}"
      resp = Net::HTTP.get(uri)
      Etherscan.logger.debug "Rsp: #{resp}"
      resp = JSON.parse(resp)

      raise resp['result'] if resp['status'] == '0'

      resp['result']
    end

    def respond_to_missing?(*_args)
      true
    end

    def method_missing(method, *args)
      module_name, action = method.to_s.split('_')
      request(module_name, action, args[0])
    end

    #########################################
    # Accounts
    #########################################
    def account_balance(address:, tag: 'latest')
      request('account', 'balance', address: address, tag: tag)
    end

    def account_balancemulti(addresses:, tag: 'latest')
      if addresses.is_a? Array
        request('account', 'balancemulti', address: addresses.join(','), tag: tag)
      elsif addresses.is_a? String
        request('account', 'balancemulti', address: addresses, tag: tag)
      else
        raise 'addresses must be an array or a string'
      end
    end

    def account_txlist(address:, startblock: 0, endblock: 999_999_999, sort: 'asc', page: 1, offset: 1000)
      request('account', 'txlist', address: address,
                                   startblock: startblock,
                                   endblock: endblock,
                                   sort: sort,
                                   page: page,
                                   offset: offset)
    end

    def account_txlistinternal(address: nil,
                               startblock: 0, endblock: 999_999_999, sort: 'asc', page: 1, offset: 1000)
      params = {
        address: address,
        startblock: startblock, endblock: endblock, sort: sort, page: page, offset: offset
      }
      request('account', 'txlistinternal', params)
    end

    def account_txlistinternal_by_txhash(txhash:)
      # https://docs.etherscan.io/api-endpoints/accounts#get-internal-transactions-by-transaction-hash
      request('account', 'txlistinternal', txhash: txhash)
    end

    def account_tokentx(address:, contractaddress:,
                        startblock: 0, endblock: 999_999_999, sort: 'asc', page: 1, offset: 1000)
      params = {
        address: address, contractaddress: contractaddress,
        startblock: startblock, endblock: endblock, sort: sort, page: page, offset: offset
      }
      request('account', 'tokentx', params)
    end

    def account_tokennfttx(address:, contractaddress:,
                           startblock: 0, endblock: 999_999_999, sort: 'asc', page: 1, offset: 1000)
      params = {
        address: address, contractaddress: contractaddress,
        startblock: startblock, endblock: endblock, sort: sort, page: page, offset: offset
      }
      request('account', 'tokennfttx', params)
    end

    #########################################
    # Contracts
    #########################################
    def contract_getabi(address:)
      request('contract', 'getabi', address: address)
    end

    def contract_getsourcecode(address:)
      request('contract', 'getsourcecode', address: address)
    end

    def contract_getcontractcreation(contractaddresses:)
      if contractaddresses.is_a? Array
        request('contract', 'getcontractcreation', contractaddresses: contractaddresses.join(','))
      elsif contractaddresses.is_a? String
        request('contract', 'getcontractcreation', contractaddresses: contractaddresses)
      else
        raise 'contractaddresses must be an array or a string'
      end
    end

    #########################################
    # Transactions
    #########################################
    def transaction_getstatus(txhash:)
      request('transaction', 'getstatus', txhash: txhash)
    end

    def transaction_gettxreceiptstatus(txhash:)
      request('transaction', 'gettxreceiptstatus', txhash: txhash)
    end

    #########################################
    # Blocks
    #########################################
    def block_getblockreward(blockno:)
      request('block', 'getblockreward', blockno: blockno)
    end

    def block_getblockcount(blockno:)
      request('block', 'getblockcount', blockno: blockno)
    end

    def block_getblocknobytime(timestamp:, closest: 'before')
      request('block', 'getblocknobytime', timestamp: timestamp, closest: closest)
    end

    #########################################
    # Logs
    #########################################
    # fromBlock, toBlock, address
    # topic0, topic1, topic2, topic3 (32 Bytes per topic)
    # topic0_1_opr (and|or between topic0 & topic1),
    # topic1_2_opr (and|or between topic1 & topic2),
    # topic2_3_opr (and|or between topic2 & topic3),
    # topic0_2_opr (and|or between topic0 & topic2),
    # topic0_3_opr (and|or between topic0 & topic3),
    # topic1_3_opr (and|or between topic1 & topic3)
    def logs_getLogs(from_block: 0, to_block: 'latest', address: nil,
                     topic0: nil, topic1: nil, topic2: nil, topic3: nil,
                     topic0_1_opr: nil, topic1_2_opr: nil, topic2_3_opr: nil,
                     topic0_2_opr: nil, topic0_3_opr: nil, topic1_3_opr: nil)
      params = {
        fromBlock: from_block, toBlock: to_block, address: address,
        topic0: topic0, topic1: topic1, topic2: topic2, topic3: topic3,
        topic0_1_opr: topic0_1_opr, topic1_2_opr: topic1_2_opr, topic2_3_opr: topic2_3_opr,
        topic0_2_opr: topic0_2_opr, topic0_3_opr: topic0_3_opr, topic1_3_opr: topic1_3_opr
      }

      request('logs', 'getLogs', params)
    end

    #########################################
    # Tokens
    #########################################
    def stats_tokensupply(contractaddress:)
      request('stats', 'tokensupply', contractaddress: contractaddress)
    end

    def account_tokenbalance(contractaddress:, address:, tag: 'latest')
      request('account', 'tokenbalance', contractaddress: contractaddress, address: address, tag: tag)
    end

    #########################################
    # Stats
    #########################################
    def stats_ethsupply
      request('stats', 'ethsupply')
    end

    def stats_ethprice
      request('stats', 'ethprice')
    end
  end
end
