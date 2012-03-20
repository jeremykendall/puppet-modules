# git init.pp

class git {
    package { 'git':
        ensure => latest,
    }

    # this is where I'll copy ssh keys and configure git

}
