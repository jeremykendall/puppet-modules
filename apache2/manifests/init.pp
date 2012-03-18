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
  }
