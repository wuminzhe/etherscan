require 'spec_helper'

describe Etherscanio::Api do
  describe 'block_getblockreward' do
    subject { Etherscanio::Api.new(apikey).block_getblockreward(blockno) }

    context 'simple status error' do
      let(:apikey) { 'YourApiKeyToken' }
      let(:blockno) { '2165403' }
      it { is_expected.to be_a(Object) }
    end
  end
end
