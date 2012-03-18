# php5 init.pp

class php5 {
    package { 'php5':
        ensure => latest,
    }

    file { 'phpinfo':
        owner   => root,
        group   => root,
        mode    => 644,
        ensure  => file,
        name    => '/var/www/i.php',
        source  => 'puppet:///modules/php5/phpinfo.php',
        require => Package['php5'],
    }
}
