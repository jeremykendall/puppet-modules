# php5 init.pp

class php5 {
    package { 'php5':
        ensure => latest,
    }

    $phpTimezone = '/bin/sed -i "s/^;date.timezone =/date.timezone = \'America\/Chicago\'/g" /etc/php5/apache2/php.ini'
    $phpShortOpenTag = '/bin/sed -i "s/^short_open_tag = On/short_open_tag = Off/g" /etc/php5/apache2/php.ini'
    $phpHtmlErrors = '/bin/sed -i "s/^html_errors = Off/html_errors = On/g" /etc/php5/apache2/php.ini'

    exec { [ $phpTimezone, $phpShortOpenTag, $phpHtmlErrors ]:
        require => Package['php5'],
        notify  => Service['apache2'],
    }

}
