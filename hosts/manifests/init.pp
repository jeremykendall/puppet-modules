# = Class: hosts
#
# This class adds localhost hostnames to /etc/hosts. Intended to aid in setting
# up vhosts for development purposes
#
# == Parameters:
#
# $hosts:: An array of hostnames
# $os::    Name of operating system where /etc/hosts will end up. host file
#          template should be suffixed with a dash and the operating system
#          name.
#
# == Requires:
#
# Nothing.
#
# == Sample Usage:
#
#   class {'ntp':
#       hosts => [ "devbox.dev", "testbox.test", ],
#       os    => "ubuntu-11.10,
#   }
#
class hosts($hosts, $os) {
    file { 'hosts':
        owner   => root,
        group   => root,
        mode    => 644,
        ensure  => file,
        path    => '/etc/hosts',
        content => template("hosts/hosts-${os}.erb"),
    }
}
