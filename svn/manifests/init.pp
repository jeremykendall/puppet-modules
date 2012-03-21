# svn init.php

class svn {
    package { 'subversion':
        ensure => latest,
    }
}
