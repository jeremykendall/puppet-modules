require_relative '../spec_helper'

describe 'sqlite3', :type => :class do
  let(:title) {'sqlite3'}
  it { should include_class('sqlite3') }
  it do
      should contain_package('sqlite3').with(
          'ensure' => 'latest'
      )
  end
end
