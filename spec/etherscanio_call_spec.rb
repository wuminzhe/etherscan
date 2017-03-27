require 'spec_helper'

describe Etherscanio::Call do
  describe 'initialize' do
    subject { Etherscanio::Call.new(mod, action) }
    context 'is a object' do
      let(:mod) { 'foo' }
      let(:action) { 'bar' }
      it { is_expected.to be_a(Object) }
    end
    context 'has mod property' do
      subject { Etherscanio::Call.new(mod, action).mod }
      let(:mod) { 'foo' }
      let(:action) { 'bar' }
      it { is_expected.to be_a(String) }
    end
    context 'has action property' do
      subject { Etherscanio::Call.new(mod, action).action }
      let(:mod) { 'foo' }
      let(:action) { 'bar' }
      it { is_expected.to be_a(String) }
    end
    context 'has action property' do
      subject { Etherscanio::Call.new(mod, action).to_s }
      let(:mod) { 'foo' }
      let(:action) { 'bar' }
      it { is_expected.to eq('module=foo&action=bar') }
    end
  end
end
