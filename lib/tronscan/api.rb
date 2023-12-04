module Tronscan
  class Api
    def initialize(url, api_key = nil)
      @url = url
      @api_key = api_key
    end

    def request(module_name, action = nil, params = {})
      action_path = action.nil? ? '' : "/#{action}"

      params = params.reject { |_k, v| v.nil? } # filter out nil values
      params_query = params.keys.map { |key| "#{key}=#{params[key]}" }.join('&').strip
      params_query = '' if params_query.empty?

      uri = URI "#{@url}/#{module_name}#{action_path}?#{params_query}"
      Etherscan.logger.debug "Req: #{uri}"

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')

      request = Net::HTTP::Get.new(uri.request_uri)
      request['TRON-PRO-API-KEY'] = @api_key unless @api_key.nil?

      resp = http.request(request).body
      # Etherscan.logger.debug "Rsp: #{resp}"
      resp = JSON.parse(resp)

      # raise resp['result'] if resp['status'] == '0'

      resp
    rescue StandardError => e
      puts e.message
      puts e.backtrace.inspect
    end

    def respond_to_missing?(*_args)
      true
    end

    def method_missing(method, *args)
      module_name, action = method.to_s.split('_')
      request(module_name, action, args[0] || {})
    end

    # def contract_getcontractcreation(contractaddresses:)
    #   if contractaddresses.is_a? Array
    #     request('contract', 'getcontractcreation', contractaddresses: contractaddresses.join(','))
    #   elsif contractaddresses.is_a? String
    #     request('contract', 'getcontractcreation', contractaddresses: contractaddresses)
    #   else
    #     raise 'contractaddresses must be an array or a string'
    #   end
    # end

  end
end
