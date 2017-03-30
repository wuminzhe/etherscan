require 'spec_helper'

describe Etherscanio::Api do
  describe 'account_balancemulti' do

    context 'multiple address' do
      subject { Etherscanio::Api.new(apikey).account_balancemulti(address, tag) }
      let(:apikey) { 'YourApiKeyToken' }
      let(:address) do
        %w(
          0xddbd2b932c763ba5b1b7ae3b362eac3e8d40121a
          0x63a9975ba31b0b9626b34300f7f627147df1f526
          0x198ef1ec325a96cc354c7266a038be8b5c558f67
        )
      end
      let(:tag) { 'latest' }
      it { is_expected.to be_a(Object) }
    end

  end
end
