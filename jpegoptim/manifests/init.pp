# jpegoptim init.pp

class jpegoptim {
    package { 'jpegoptim':
        ensure => latest,
    }
}
