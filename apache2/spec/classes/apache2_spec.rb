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

    it { should contain_file('/etc/apache2/mods-enabled/rewrite.load'). with(
        'ensure' => 'symlink',
        'target' => '/etc/apache2/mods-available/rewrite.load',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
    )}
end
