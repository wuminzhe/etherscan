require 'spec_helper'

describe Etherscanio::Api do
  describe 'contract_getabi' do
    subject { Etherscanio::Api.new(apikey).contract_getabi(address) }

    context 'one address' do
      let(:apikey) { 'YourApiKeyToken' }
      let(:address) { '0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae' }
      it { is_expected.to be_a(Object) }
    end
  end
end
