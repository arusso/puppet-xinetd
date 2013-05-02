# == Define: xinetd::service_entry
#
# Installs/removes an xinetd service
#
# === Parameters:
#
# [*ensure*]
#
# Ensure the daemon is present/absent
#
# [*options*]
#
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
define xinetd::service_entry (
  $ensure = 'present',
  $options = undef
) {
  case downcase( $ensure ) {
    /(?i)^(absent|false)/: { $ensure_r = 'absent' }
    /(?i)^(present|true)/: { $ensure_r = 'present' }
    default: {
      fail("Xinetd::Daemon[${name}] : Invalid ensure value - ${ensure}")
    }
  }

  file { "/etc/xinetd.d/${title}":
    ensure  => $ensure_r,
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
    content => template('xinetd/service_entry.erb'),
    notify  => Class['xinetd::service'],
  }
}
