require 'spec_helper'

describe Etherscanio::Api do
  describe 'transaction_getstatus' do
    subject { Etherscanio::Api.new(apikey).transaction_getstatus(txhash) }

    context 'simple status error' do
      let(:apikey) { 'YourApiKeyToken' }
      let(:txhash) { '0x15f8e5ea1079d9a0bb04a4c58ae5fe7654b5b2b4463375ff7ffb490aa0032f3a' }
      it { is_expected.to be_a(Object) }
    end
  end
end
