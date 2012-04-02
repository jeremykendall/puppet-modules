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

    file { "/etc/apache2/mods-enabled/rewrite.load":
        ensure => symlink,
        target => "/etc/apache2/mods-available/rewrite.load",
        notify => Service['apache2'],
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
    }

    file { "/etc/apache2/sites-enabled/000-default":
        ensure => absent,
        notify => Service['apache2'],
    }

  }
