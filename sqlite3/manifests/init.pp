# sqlite3 init.pp

class sqlite3 {
    package { 'sqlite3':
        ensure => latest,
    }
}
