require 'spec_helper'

describe Etherscanio::Api do
  describe 'initialize' do

    subject { Etherscanio::Api.new(apikey).account_balance(address, tag) }

    context '' do
      let(:apikey) { 'foo' }
      let(:address) { 'ox123' }
      let(:tag) { 'foo' }
      it { is_expected.to be_a(Object) }
    end
  end
end
