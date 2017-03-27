require 'bundler/setup'
require 'webmock/rspec'
require './lib/etherscanio/api'
require './lib/etherscanio/call'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.before(:each) do
    # stub_request(:get, error500)
    # .to_return(status: 500, body: '', headers: {})
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
