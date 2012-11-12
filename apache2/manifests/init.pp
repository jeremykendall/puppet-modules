# init.pp

class apache2 {
    package { 'apache2':
      ensure => latest,
    }

    service { 'apache2':
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
      require    => Package['apache2'],
    }
    
    # enable mod_rewrite
    file { '/etc/apache2/mods-enabled/rewrite.load':
        ensure => symlink,
        target => '/etc/apache2/mods-available/rewrite.load',
        notify => Service['apache2'],
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
    }

    exec { 'apache2_user_group':
        command => '/bin/sed -i "s/www-data/vagrant/g" /etc/apache2/envvars',
        onlyif  => '/bin/grep -c "www-data" /etc/apache2/envvars',
        notify  => Service['apache2']
    }

    exec { 'server-name':
        command => 'echo "ServerName localhost" | sudo tee /etc/apache2/httpd.conf',
        path    => ['/bin', '/usr/bin'],
        unless  => '/bin/grep -c "ServerName localhost" /etc/apache2/httpd.conf',
        notify  => Service['apache2']
    }
}
