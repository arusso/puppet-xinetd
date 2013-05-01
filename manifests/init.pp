# == Class: xinetd
# Setups xinetd so we can begin adding packages to it
#
# === Parameters:
# [*service_enable*]
# Should we enable the service on boot?
#
#   service_enable = <true|false>
#
# [*service_ensure*]
# Should we ensure the service is in a particular state?
#
#   service_ensure => <'running'|'stopped'|undef>
#
class xinetd (
  $service_enable = true,
  $service_ensure = running
) {
  # validate inputs yo
  if $service_ensure != undef { validate_re( '(?i)^(running|stopped)$' ) }
  if $service_enable != undef { validate_bool( $service_enable ) }

  $service_ensure_r = $service_ensure
  $service_enable_r = $service_enable

  include xinetd::package, xinetd::service

  Class['xinetd'] -> Class['xinetd::package'] ~> Class['xinetd::service']
}
