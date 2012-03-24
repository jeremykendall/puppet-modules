# zf1 init.pp

class zf1 {

    exec { 'mkdir -p /usr/share/phplib/':
        path   => '/bin',
        alias  => 'mkzenddir',
        before => Exec['cozf1'],
    }

    exec { 'svn co http://framework.zend.com/svn/framework/standard/tags/release-1.11.11/ /usr/share/phplib/ZendFramework-1.11.11/':
        path     => '/usr/bin',
        alias    => 'cozf1',
        requires => Exec['mkzenddir'],
        before   => Exec['zfln'],
    }

    exec { 'ln -s /usr/share/phplib/ZendFramework-1.11.11/library/Zend /usr/share/php/Zend':
        path     => '/bin',
        requires => Exec ['cozf1'],
        alias    => 'zfln',
    }
}
