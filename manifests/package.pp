# == Class: xinetd::package
#
# Installs the xinetd package
#
class xinetd::package {
  package { 'xinetd': ensure => installed }
}
