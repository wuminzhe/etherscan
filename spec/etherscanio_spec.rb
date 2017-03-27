require 'spec_helper'

describe Etherscanio::Api do
  describe 'initialize' do
    subject { Etherscanio::Api.new(context) }

    context 'is a object' do
      let(:context) { 'foo' }
      it { is_expected.to be_a(Object) }
    end
  end
end
