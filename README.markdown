# xinetd Module

This module provides mechanisms to manage your xinetd services

# Examples

    xinetd::service_entry { 'nrpe':
      ensure             => 'present',
      options            => {
        'flags'          => 'REUSE',
        'type'           => 'UNLISTED',
        'port'           => '5666',
        'socket_type'    => 'stream',
        'wait'           => 'no',
        'user'           => 'nrpe',
        'group'          => 'nrpe',
        'server'         => '/usr/sbin/nrpe',
        'server_args'    => '-c /etc/nagios/nrpe.cfg --inetd',
        'log_on_failure' => 'USERID',
        'disable'        => $xinetd_disable,
        'only_from'      => join($nrpe::allowed_hosts_r, ' '),
      }
    }

License
-------

See LICENSE file

Copyright
---------

Copyright &copy; 2014 The Regents of the University of California

Contact
-------

Aaron Russo <arusso@berkeley.edu>

Support
-------

Please log tickets and issues at the
[Projects site](https://github.com/arusso/puppet-xinetd/issues/)
