# postgresql init.pp

class postgresql {
    package { 'postgresql':
        ensure => latest,
    }

    package { 'pgadmin3':
        ensure  => latest,
        require => Package['postgresql'],
    }
}
