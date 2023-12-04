require 'spec_helper'

RSpec.describe Subscan::Api do
  before do
    Etherscan.logger.level = Logger::DEBUG
  end

  it 'evm_contract should work' do
    result = Etherscan.crab.evm_contract(address: '0xAF5cAa87a7d3718622604268C43fF6cE9d2cEc3C')
    expect(result['address']).to eq('0xaf5caa87a7d3718622604268c43ff6ce9d2cec3c')
  end
end
