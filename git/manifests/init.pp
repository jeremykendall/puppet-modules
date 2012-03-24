# git init.pp

class git($name, $email) {
    package { 'git':
        ensure => latest,
    }

    exec { "git config --global user.name \"${name}\"":
        path => '/usr/bin',
    }

    exec { "git config --global user.email \"${email}\"":
        path => '/usr/bin',
    }
}
