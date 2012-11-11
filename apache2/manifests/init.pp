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
}
