# == Class: xinetd
#
# Setup xinetd so we can begin adding services behind it
#
# === Parameters:
#
# [*service_enable*]
#
# Determine whether we should start the service on boot.  Valid values are
# true, false or 'undef'. Default is true.
#
# [*service_ensure*]
#
# Determine if we should ensure the service is in a particular state. Valid
# values are 'running', 'stopped' or 'undef'. Default is running.
#
class xinetd  {
  include xinetd::package, xinetd::service

  Class['xinetd'] -> Class['xinetd::package'] ~> Class['xinetd::service']
}
