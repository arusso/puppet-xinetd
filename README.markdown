# xinetd Module #

This module provides mechanisms to manage your xinetd services

# Examples #

<pre><code>
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
</code></pre>
 

License
-------

None

Change Log
----------

* 0.0.1 : Initial Release

Contact
-------

Aaron Russo <arusso@berkeley.edu>

Support
-------

Please log tickets and issues at the
[Projects site](https://github.com/arusso23/puppet-xinetd/issues/)
