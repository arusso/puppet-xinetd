class xinetd::service {
  service { 'xinetd':
    ensure => running,
    enable => true,
  }
}
