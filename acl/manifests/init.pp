# acl init.pp

class acl {
    package { 'acl':
        ensure => latest,
    }

    file { 'updatefstab.sh':
        ensure  => file,
        mode    => '0777',
        path    => '/tmp/updatefstab.sh',
        source  => 'puppet:///modules/acl/updatefstab.sh',
        before  => Exec['updatefstab'],
        require => Package['acl'],
    }

    exec { 'updatefstab':
        command => '/bin/sh /tmp/updatefstab.sh',
        require => Package['acl'],
    }
}
