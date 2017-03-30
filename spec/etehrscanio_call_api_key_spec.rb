require 'spec_helper'

describe Etherscanio::Call do
  let(:uri) { 'http://api.etherscan.io/api?' }
  subject do
    call = Etherscanio::Call.new('foo', 'bar')
    call.api_key = api_key
    call.to_s
  end
  context 'with api_key' do
    let(:api_key) { '123' }
    it { is_expected.to eq(uri + 'module=foo&action=bar&apikey=123') }
  end
end
