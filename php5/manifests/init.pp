# php5 init.pp

class php5 {
    package { 'php5':
        ensure => latest,
    }

    package { 'php5-cli':
        ensure => latest,
    }

    $phpTimezone = '/bin/sed -i "s/^;date.timezone =/date.timezone = \'America\/Chicago\'/g" /etc/php5/apache2/php.ini'
    $phpShortOpenTag = '/bin/sed -i "s/^short_open_tag = On/short_open_tag = Off/g" /etc/php5/apache2/php.ini'

    exec { [ $phpTimezone, $phpShortOpenTag ]:
        require => Package['php5'],
        notify  => Service['apache2'],
    }

}
