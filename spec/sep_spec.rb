require 'spec_helper'

RSpec.describe Etherscan::Api do
  before do
    Etherscan.logger.level = Logger::DEBUG
  end

  it 'transaction_getstatus should work' do
    txhash = '0x2bb26e2b893177bbf849d7ecc80abeed27a666abfcbae9df0648e9fe73525475'
    result = Etherscan.sep.transaction_getstatus(txhash: txhash)
    expect(result).to eq({ 'isError' => '0', 'errDescription' => '' })
  end

  it 'account_txlistinternal_by_txhash should work' do
    txhash = '0x2bb26e2b893177bbf849d7ecc80abeed27a666abfcbae9df0648e9fe73525475'
    result = Etherscan.sep.account_txlistinternal_by_txhash(txhash: txhash)
    expect(result).to eq([{
                           'blockNumber' => '4806916',
                           'timeStamp' => '1701505524',
                           'from' => '0x95ff8d3ce9dcb7455beb7845143bea84fe5c4f6f',
                           'to' => '0x2909db987aa74120a15f743197c58be1b8d5e83b',
                           'value' => '110',
                           'contractAddress' => '',
                           'input' => '',
                           'type' => 'call',
                           'gas' => '9166630',
                           'gasUsed' => '0',
                           'isError' => '0',
                           'errCode' => ''
                         }])
  end
end
