# postgresql init.pp

class postgresql {
    package { 'postgresql':
        ensure => latest,
    }

    service { 'postgresql':
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
        require    => Package['postgresql'],
    }

}
