require 'spec_helper'

describe Etherscanio::Api do
  describe 'account_getminedblocks' do
    subject { Etherscanio::Api.new(apikey).account_getminedblocks(address, blocktype) }

    context 'no paging' do
      let(:apikey) { 'YourApiKeyToken' }
      let(:address) { '0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae' }
      let(:blocktype) { 'block' }
      it { is_expected.to be_a(Object) }
    end

    context 'paging' do
      subject { Etherscanio::Api.new(apikey).account_getminedblocks(address, blocktype, page, offset) }
      let(:apikey) { 'YourApiKeyToken' }
      let(:address) { '0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae' }
      let(:page) { 1 }
      let(:offset) { 10 }
      let(:blocktype) { 'block' }
      it { is_expected.to be_a(Object) }
    end
  end
end
