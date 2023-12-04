require 'spec_helper'

RSpec.describe Tronscan::Api do
  before do
    Etherscan.logger.level = Logger::DEBUG
  end

  it 'account_list should work' do
    result = Etherscan.tron.account_list(sort: '-balance', limit: 20, start: 0)
    expect(result['data'].length).to eq(20)
  end

  it 'accountv2 should work' do
    result = Etherscan.tron.accountv2(address: 'TSTVYwFDp7SBfZk7Hrz3tucwQVASyJdwC7')
    expect(result['date_created']).to eq(1_625_827_644_000)
  end

  it 'contract should work' do
    result = Etherscan.tron.contract(contract: 'TSSMHYeV2uE9qYH95DqyoCuNCzEL1NvU3S')
    p result
  end
end
