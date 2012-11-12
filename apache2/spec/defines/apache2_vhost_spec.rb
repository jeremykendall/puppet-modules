require_relative '../spec_helper'

describe 'apache2::vhost', :type => :define do

    let(:title) { 'devbox.dev' }
    let(:params) { { 
        :port            => 80,
        :docroot         => '/www/dev.devbox',
        :configfile_name => 'dev.devbox'
    } }

    it do

        should include_class('apache2')

        should contain_file('/etc/apache2/sites-available/dev.devbox').with({
            # How the hell do I test content template?
            'owner' => 'root',
            'group' => 'root',
            'mode'  => '0644'
        })
        
        should contain_file('/etc/apache2/sites-enabled/dev.devbox').with({
            'ensure' => 'symlink',
            'target' => '/etc/apache2/sites-available/dev.devbox'
        })
    end
end
