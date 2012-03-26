# acl init.pp

class acl {
    package { 'acl':
        ensure => latest,
    }

    exec { 'update fstab':
        command => '/bin/sh puppet:///modules/acl/updatefstab.sh',
        require => Package['acl'],
    }
}
