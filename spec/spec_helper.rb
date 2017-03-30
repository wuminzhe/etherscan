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

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.before(:each) do
    stub_request(:get, account_balance_uri)
      .with(headers: general_headers)
      .to_return(status: 200, body: account_balance_response, headers: {})
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
