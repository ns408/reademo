require 'spec_helper'
describe 'REAdemo' do
  context 'with default values for all parameters' do
    it { should contain_class('REAdemo') }
  end
end
