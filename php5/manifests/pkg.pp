# php5::package.pp

define ph5::package ($name) {
    package $name: {
        ensure  => latest,
        require => Package['php5'],
    }
}
