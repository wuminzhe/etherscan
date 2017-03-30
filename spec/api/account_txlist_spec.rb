require 'spec_helper'

describe Etherscanio::Api do
  describe 'account_txlist' do
    subject { Etherscanio::Api.new(apikey).txlist(address, startblock, endblock, sort) }

    context '0 to 99999999' do
      let(:apikey) { 'YourApiKeyToken' }
      let(:address) { '0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae' }
      let(:startblock) { 0 }
      let(:endblock) { 99999999 }
      let(:sort) { 'desc' }
      it { is_expected.to be_a(Object) }
    end
  end
end
