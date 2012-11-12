require_relative '../spec_helper'

describe 'acl', :type => :class do

    let(:title) {'acl'}

    it { should include_class('acl') }

    it do
        should contain_package('acl').with(
            'ensure' => 'latest'
        )
        should contain_file('updatefstab.sh').with(
            'ensure' => 'file',
            'mode'   => '0777',
            'path'   => '/tmp/updatefstab.sh',
            'source'  => 'puppet:///modules/acl/updatefstab.sh'
        )
        should contain_exec('updatefstab').with(
            'command' => '/bin/sh /tmp/updatefstab.sh'
        )
    end
end
