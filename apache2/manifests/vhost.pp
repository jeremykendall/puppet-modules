# Definition: apache2::vhost
#
# This class installs Apache Virtual Hosts
#
# Parameters:
# - The $port to configure the host on
# - The $docroot provides the DocumentationRoot variable
# - The $template option specifies whether to use the default template
#   or override
# - The $serveraliases of the site
# - The $options for the given vhost
# - The $allowoverride option for the given host
# - The $vhost_name for name based virtualhosting, defaulting to *
# - The $config_name specifies the name of the config file
#
# Actions:
# - Install Apache Virtual Hosts
#
# Requires:
# - The apache2 class
#
# Sample Usage:
#  apache2::vhost { 'site.name.fqdn':
#    port => '80',
#    docroot => '/path/to/docroot',
#  }
#
define apache2::vhost(
    $port,
    $docroot,
    $template        = 'apache2/vhost-default.conf.erb',
    $servername      = $title,
    $serveraliases   = '',
    $options         = 'Indexes FollowSymLinks MultiViews',
    $allowoverride   = 'all',
    $vhost_name      = '*',
    $configfile_name = $title,
  ) {

  include apache2

  $logdir = '/var/log/apache2'

  file {
    "/etc/apache2/sites-available/${configfile_name}":
      content => template($template),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package['apache2'],
  }

  file { "/etc/apache2/sites-enabled/${configfile_name}":
      ensure  => symlink,
      target  => "/etc/apache2/sites-available/${configfile_name}",
      require => File["/etc/apache2/sites-available/${configfile_name}"],
      notify  => Service['apache2'],
  }
}
