require 'spec_helper'

describe Etherscanio::Call do
  describe '.address' do
    subject do
      call = Etherscanio::Call.new('foo', 'bar')
      call.address = address
      call.to_s
    end
    context '123' do
      let(:address) { '123' }
      it { is_expected.to eq('module=foo&action=bar&address=123') }
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
      it { is_expected.to eq('module=foo&action=bar&tag=house') }
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
      it { is_expected.to eq('module=foo&action=bar&startblock=1') }
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
      it { is_expected.to eq('module=foo&action=bar&endblock=1') }
    end
  end
end
