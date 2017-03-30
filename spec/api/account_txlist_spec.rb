require 'spec_helper'

describe Etherscanio::Api do
  describe 'account_txlist' do
    subject { Etherscanio::Api.new(apikey).txlist(address, startblock, endblock, sort) }

    context 'no paging' do
      let(:apikey) { 'YourApiKeyToken' }
      let(:address) { '0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae' }
      let(:startblock) { 0 }
      let(:endblock) { 99_999_999 }
      let(:sort) { 'desc' }
      it { is_expected.to be_a(Object) }
    end
    context 'paging' do
      subject { Etherscanio::Api.new(apikey).txlist(address, startblock, endblock, sort, page, offset) }
      let(:apikey) { 'YourApiKeyToken' }
      let(:address) { '0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae' }
      let(:startblock) { 0 }
      let(:endblock) { 99_999_999 }
      let(:sort) { 'desc' }
      let(:page) { 1 }
      let(:offset) { 10 }
      it { is_expected.to be_a(Object) }
    end
  end
end
