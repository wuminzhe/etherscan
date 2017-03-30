require 'spec_helper'

describe Etherscanio::Api do
  describe 'account_balance' do
    subject { Etherscanio::Api.new(apikey).account_balance(address, tag) }

    context 'one address' do
      subject { Etherscanio::Api.new(apikey).account_balance(address, tag) }
      let(:apikey) { 'YourApiKeyToken' }
      let(:address) { '0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae' }
      let(:tag) { 'latest' }
      it { is_expected.to be_a(Object) }
    end
  end
end
