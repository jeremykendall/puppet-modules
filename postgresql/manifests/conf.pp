# postgresql::conf.pp

class postgresql::conf(
    $pgmethod,
    $template = 'postgresql/pg_hba.conf.erb',
) {
    #    augeas { 'pg_hba':
    #    context => "/files/etc/postgresql/9.1/main/pg_hba.conf",
    #    changes => "set *[type = 'local'][database = 'all'][user = 'all'][method = 'peer']/method md5",
    #    require => Package['postgresql'],
    # }

    file { "/etc/postgresql/9.1/main/pg_hba.conf":
        content => template($template),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package['postgresql'],
    }

    file { '/tmp/user-config.sql':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package['postgresql'],
        before  => Exec['user-config'],
    }

    exec { 'sudo -u postgres psql < /tmp/user-config.sql':
        path    => '/usr/bin',
        alias   => 'user-config',
        require => File['/tmp/user-config.sql'],
    }
}
