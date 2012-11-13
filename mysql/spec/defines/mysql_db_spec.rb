require_relative '../spec_helper'

describe 'mysql::db', :type => :define do
    let(:title) { 'flaming_archer' }
    let(:params) { {
        :username => 'testuser',
        :password => 'testpass'
    } }

    it do
        should contain_exec('create-flaming_archer-db').with(
            'unless'  => 'mysql -u root flaming_archer',
            'path'    => ['/bin', '/usr/bin'],
            'command' => 'mysql -u root -e "CREATE DATABASE flaming_archer;"'
        )
        
        should contain_exec('grant-flaming_archer-db').with(
            'unless'  => 'mysql -u testuser -ptestpass flaming_archer',
            'path'    => ['/bin', '/usr/bin'],
            'command' => 'mysql -u root -e "GRANT ALL ON flaming_archer.* TO testuser@localhost IDENTIFIED BY \'testpass\';"'
        )
    end
end
