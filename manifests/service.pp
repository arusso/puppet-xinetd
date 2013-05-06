# == Class: xinetd::service
#
# Manages the xinetd service
#
class xinetd::service {
  service { 'xinetd':
    ensure => running,
    enable => true,
  }
}
