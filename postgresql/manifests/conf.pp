# postgresql::conf.pp

class postgresql::conf {
    augeas { 'pg_hba':
        context => "/files/etc/postgresql/9.1/main/pg_hba.conf",
        changes => "set *[type = 'local'][database = 'all'][user = 'all'][method = 'peer']/method md5",
        require => Package['postgresql'],
    }
}
