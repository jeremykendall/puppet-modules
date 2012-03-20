# zf1 init.pp

class zf1 {

    exec { 'mkdir -p /usr/share/php/Zend/':
        path   => 'bin',
        alias  => 'mkzenddir',
        before => Exec['cozf1'],
    }

    exec { 'svn co
    http://framework.zend.com/svn/framework/standard/tags/release-1.11.11/library/Zend/
    /usr/share/php/Zend/':
        path     => '/usr/bin',
        alias    => 'cozf1',
        requires => [Package['svn'], Package['php5'],],
    }
}
