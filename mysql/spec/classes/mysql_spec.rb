require_relative '../spec_helper'

describe 'mysql', :type => :class do

    let(:title) {'mysql'}

    it { should include_class('mysql') }

    it do
        should contain_package('mysql-server').with(
            'ensure' => 'latest'
        )

        should contain_service('mysql').with(
            'ensure' => 'running'
        )
    end
end
