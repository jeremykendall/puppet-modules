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

    file { '/tmp/user-config.sql':
        ensure  => present,
        owner   => 'postgres',
        group   => 'postgres',
        mode    => '0644',
        source  => 'puppet:///modules/postgresql/user-config.sql',
        require => Package['postgresql'],
        before  => File['pg_hba'],
    }

    exec { 'sudo -u postgres psql < /tmp/user-config.sql':
        path    => '/usr/bin',
        alias   => 'user-config',
        require => File['/tmp/user-config.sql'],
        before  => File['pg_hba'],
    }

    file { "/etc/postgresql/9.1/main/pg_hba.conf":
        alias   => 'pg_hba',
        content => template($template),
        owner   => 'postgres',
        group   => 'postgres',
        mode    => '0640',
        notify  => Service['postgresql'],
    }

}
