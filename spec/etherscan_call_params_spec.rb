require 'spec_helper'

describe Etherscanio::Call do
  let(:uri) { 'http://api.etherscan.io/api?' }
  describe '.address' do
    subject do
      call = Etherscanio::Call.new('foo', 'bar')
      call.address = address
      call.to_s
    end
    context '123' do
      let(:address) { '123' }
      it { is_expected.to eq(uri + 'module=foo&action=bar&address=123') }
    end
  end

  describe '.tag' do
    subject do
      call = Etherscanio::Call.new('foo', 'bar')
      call.tag = tag
      call.to_s
    end
    context 'house' do
      let(:tag) { 'house' }
      it { is_expected.to eq(uri + 'module=foo&action=bar&tag=house') }
    end
  end
  describe '.startblock' do
    subject do
      call = Etherscanio::Call.new('foo', 'bar')
      call.startblock = startblock
      call.to_s
    end
    context '1' do
      let(:startblock) { 1 }
      it { is_expected.to eq(uri + 'module=foo&action=bar&startblock=1') }
    end
  end
  describe '.endblock' do
    subject do
      call = Etherscanio::Call.new('foo', 'bar')
      call.endblock = endblock
      call.to_s
    end
    context '1' do
      let(:endblock) { 1 }
      it { is_expected.to eq(uri + 'module=foo&action=bar&endblock=1') }
    end
  end
  describe '.sort' do
    subject do
      call = Etherscanio::Call.new('foo', 'bar')
      call.sort = sort
      call.to_s
    end
    context 'desc' do
      let(:sort) { 'desc' }
      it { is_expected.to eq(uri + 'module=foo&action=bar&sort=desc') }
    end
  end
  describe '.page' do
    subject do
      call = Etherscanio::Call.new('foo', 'bar')
      call.page = page
      call.to_s
    end
    context '1' do
      let(:page) { 1 }
      it { is_expected.to eq(uri + 'module=foo&action=bar&page=1') }
    end
  end
  describe '.txhash' do
    subject do
      call = Etherscanio::Call.new('foo', 'bar')
      call.txhash = txhash
      call.to_s
    end
    context 'a' do
      let(:txhash) { 'a' }
      it { is_expected.to eq(uri + 'module=foo&action=bar&txhash=a') }
    end
  end
  describe '.blockno' do
    subject do
      call = Etherscanio::Call.new('foo', 'bar')
      call.blockno = blockno
      call.to_s
    end
    context 'a' do
      let(:blockno) { 100 }
      it { is_expected.to eq(uri + 'module=foo&action=bar&blockno=100') }
    end
  end
end
