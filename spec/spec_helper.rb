require 'bundler/setup'
require 'webmock/rspec'
require './lib/etherscanio/api'
require './lib/etherscanio/call'

general_headers = {
  'Accept' => '*/*',
  'Accept-Encoding' => 'gzip, deflate',
  'Host' => 'api.etherscan.io',
  'User-Agent' => 'rest-client/2.0.1 (darwin16.4.0 x86_64) ruby/2.3.1p112'
}

account_balance_response = File.read('./spec/fixtures/account/balance.json')
account_balance_uri = 'http://api.etherscan.io/api?action=balance&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&module=account&tag=latest'

multiple_account_balance_uri = 'http://api.etherscan.io/api?action=balancemulti&address=0xddbd2b932c763ba5b1b7ae3b362eac3e8d40121a,0x63a9975ba31b0b9626b34300f7f627147df1f526,0x198ef1ec325a96cc354c7266a038be8b5c558f67&module=account&tag=latest'
multiple_account_balance_response = File.read('./spec/fixtures/account/balance_multiple.json')

account_txlist_uri = 'http://api.etherscan.io/api?action=txlist&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&endblock=99999999&module=account&sort=desc&&startblock=0'
account_txlist_response = File.read('./spec/fixtures/account/txlist.json')

account_txlist_paging_uri = 'http://api.etherscan.io/api?action=txlist&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&endblock=99999999&module=account&page=1&sort=desc&startblock=0'
account_txlist_paging_response = File.read('./spec/fixtures/account/txlist.json')

account_txlist_internal_uri = 'http://api.etherscan.io/api?action=txlistinternal&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&endblock=99999999&module=account&startblock=0'
account_txlist_internal_response = File.read('./spec/fixtures/account/txlist_internal.json')

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.before(:each) do
    stub_request(:get, account_balance_uri)
      .with(headers: general_headers)
      .to_return(status: 200, body: account_balance_response, headers: {})

    stub_request(:get, multiple_account_balance_uri)
      .with(headers: general_headers)
      .to_return(status: 200, body: multiple_account_balance_response, headers: {})

    stub_request(:get, account_txlist_uri)
      .with(headers: general_headers)
      .to_return(status: 200, body: account_txlist_response, headers: {})

    stub_request(:get, account_txlist_paging_uri)
      .with(headers: general_headers)
      .to_return(status: 200, body: account_txlist_paging_response, headers: {})

    stub_request(:get, account_txlist_internal_uri)
      .with(headers: general_headers)
      .to_return(status: 200, body: account_txlist_internal_response, headers: {})

  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
