module Subscan
  class Api
    def initialize(url, api_key = nil)
      @url = url
      @api_key = api_key
    end

    def request(module_name, action, params = {})
      params = params.reject { |_k, v| v.nil? } # filter out nil values

      url = "#{@url}/scan/#{module_name}/#{action}"
      uri = URI(url)
      Etherscan.logger.debug "Req: #{uri}"

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')

      request = Net::HTTP::Post.new(uri)
      request['Content-Type'] = 'application/json'
      request['X-API-Key'] = @api_key unless @api_key.nil?
      request.body = params.to_json
      Etherscan.logger.debug "Body: #{request.body}"

      response = http.request(request)

      raise response.body if response.code != '200'

      json_response = JSON.parse(response.body)

      if json_response.key?('status')
        raise json_response['message'] if json_response['status'] != '1'

        json_response['result'] || json_response['message']
      elsif json_response.key?('code') # normal response
        raise json_response['message'] if json_response['code'] != 0

        json_response['data']
      end
    end

    def respond_to_missing?(*_args)
      true
    end

    def method_missing(method, *args)
      module_name, action = method.to_s.split('_')
      request(module_name, action, args[0] || {})
    end
  end
end
