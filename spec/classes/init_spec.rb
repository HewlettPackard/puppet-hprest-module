require 'spec_helper'
describe 'hprest' do

  context 'with default values for all parameters' do
    it { should contain_class('hprest') }
  end
end
