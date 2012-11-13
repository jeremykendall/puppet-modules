define mysql::db($username, $password) {

    exec { "create-${name}-db":
        unless  => "mysql -u root ${name}",
        path    => ['/bin', '/usr/bin'],
        command => "mysql -u root -e \"CREATE DATABASE ${name};\"",
        require => Service['mysql']
    }

    exec { "grant-${name}-db":
        unless  => "mysql -u ${username} -p${password} ${name}",
        path    => ['/bin', '/usr/bin'],
        command => "mysql -u root -e \"GRANT ALL ON ${name}.* TO ${username}@localhost IDENTIFIED BY '$password';\"",
        require => [Service['mysql'], Exec["create-${name}-db"]]
    }
}
