require_relative '../spec_helper'

describe 'apache2', :type => :class do

    let(:title) {'apache2'}

    it { should include_class('apache2') }

    it { should contain_package('apache2').with(
        'ensure' => 'latest'
    )}

    it { should contain_service('apache2').with(
        'ensure'     => 'running',
        'enable'     => true,
        'hasstatus'  => true,
        'hasrestart' => true
    )}
end
