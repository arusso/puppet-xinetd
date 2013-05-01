# == Define: xinetd::daemon
# Installs/removes an xinetd daemon
# === Parameters:
# [*ensure*]
# Ensure the daemon is installed/removed
#
#   ensure => <'installed'|'present'>
#
# [*options*]
# Hash of settings to add to the daemon file
#
#   options     => {
#     flags     => 'NODELAY IPv4 IPv6 REUSE',
#     protocol  => 'stream',
#     server    => '/usr/bin/nrpe',
#     user      => 'nrpe',
#     group     => 'nrpe',
#     only_from => '127.0.0.1 192.168.0.0/24'
#   }
#
define xinetd::daemon (
  $ensure = undef,
  $options = undef
) {
  $ensure_r = $ensure ? {
    /(?i)^absent$/ => 'absent',
    default        => 'present',
  }

  file { "/etc/xinetd.d/${title}":
    ensure  => $ensure_r,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => template('xinetd/daemon.erb'),
    notify  => Class['xinetd::service'],
  }
}
