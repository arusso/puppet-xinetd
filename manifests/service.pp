class xinetd::service {
  service { 'xinetd':
    ensure => $xinetd::service_ensure_r,
    enable => $xinetd::service_enable_r,
  }
}
