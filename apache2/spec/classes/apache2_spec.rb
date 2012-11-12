require_relative '../spec_helper'

describe 'apache2', :type => :class do

    let(:title) {'apache2'}

    it { should include_class('apache2') }

    it do
    
        should contain_package('apache2').with(
            'ensure' => 'latest'
        )

        should contain_service('apache2').with(
            'ensure'     => 'running',
            'enable'     => true,
            'hasstatus'  => true,
            'hasrestart' => true
        )

        should contain_file('/etc/apache2/mods-enabled/rewrite.load'). with(
            'ensure' => 'symlink',
            'target' => '/etc/apache2/mods-available/rewrite.load',
            'owner'  => 'root',
            'group'  => 'root',
            'mode'   => '0644',
        ) 

        should contain_exec('apache2_user_group').with(
            'command' => '/bin/sed -i "s/www-data/vagrant/g" /etc/apache2/envvars',
            'onlyif'  => '/bin/grep -c "www-data" /etc/apache2/envvars'
        )

    end 
end
