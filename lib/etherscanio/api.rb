module Etherscanio
  class Api
    def initialize(_key)
      nil
    end
    def account_balance(address, tag)
      call = Etherscanio::Call.new('account', 'balance')
      call.address = address
      call.tag = tag
      call.to_s
    end
  end
end
