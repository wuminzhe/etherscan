require 'spec_helper'

describe Etherscanio::Call do
  describe 'initialize' do
    subject { Etherscanio::Call.new(mod, action) }
    context 'is a object' do
      let(:mod) { 'foo' }
      let(:action) { 'bar' }
      it { is_expected.to be_a(Object) }
    end
    context '.mod' do
      subject { Etherscanio::Call.new(mod, action).mod }
      let(:mod) { 'foo' }
      let(:action) { 'bar' }
      it { is_expected.to be_a(String) }
    end
    context '.action' do
      subject { Etherscanio::Call.new(mod, action).action }
      let(:mod) { 'foo' }
      let(:action) { 'bar' }
      it { is_expected.to be_a(String) }
    end
    context 'to_s' do
      subject { Etherscanio::Call.new(mod, action).to_s }
      let(:mod) { 'foo' }
      let(:action) { 'bar' }
      let(:uri) { 'https://api.etherscan.io/api?' }
      it { is_expected.to eq(uri  + 'module=foo&action=bar') }
    end
  end
end
