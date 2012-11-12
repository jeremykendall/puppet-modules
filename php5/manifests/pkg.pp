# php5::pkg.pp

define php5::pkg() {
    package { "${name}":
        ensure  => latest,
        require => Package['php5'],
        notify  => Service['apache2']
    }
}
