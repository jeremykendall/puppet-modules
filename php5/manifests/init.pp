# php5 init.pp

class php5 {
    package { 'php5':
        ensure => latest,
    }

    exec { 'date_timezone':
        command => '/bin/sed -i "s/^;date.timezone =/date.timezone = \'America\/Chicago\'/g" /etc/php5/apache2/php.ini',
        onlyif  => 'grep -c ";date.timezone =" /etc/php5/apache2/php.ini',
        require => Package['php5'],
        notify  => Service['apache2']
    }

    exec { 'short_tags_off':
        command => '/bin/sed -i "s/^short_open_tag = On/short_open_tag = Off/g" /etc/php5/apache2/php.ini',
        onlyif => 'grep -c "short_open_tag = On" /etc/php5/apache2/php.ini',
        require => Package['php5'],
        notify  => Service['apache2']
    }

    exec { 'html_errors_on':
        command => '/bin/sed -i "s/^html_errors = Off/html_errors = On/g" /etc/php5/apache2/php.ini',
        onlyif => 'grep -c "html_errors = Off" /etc/php5/apache2/php.ini',
        require => Package['php5'],
        notify  => Service['apache2']
    }

}
