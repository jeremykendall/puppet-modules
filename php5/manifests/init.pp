# php5 init.pp

class php5 {
    package { 'php5':
        ensure => latest,
    }

    package { 'php5-intl':
        ensure  => latest,
        require => Package['php5'],
    }

    package { 'php5-pgsql':
        ensure  => latest,
        require => Package['php5'],
    }

    file { 'phpinfo':
        owner   => root,
        group   => root,
        mode    => 644,
        ensure  => file,
        name    => '/var/www/i.php',
        source  => 'puppet:///modules/php5/phpinfo.php',
        require => Package['php5'],
        notify  => Service['apache2'],
    }
}
