class ssh::config (
  $permit_root_login = $ssh::config_permit_root_login,
  $tcpforwarding     = $ssh::config_tcpforwarding,
  $printmotd         = $ssh::config_printmotd,
  $printlastlog      = $ssh::config_printlastlog,
  $brsnoop           = $ssh::brsnoop,
) {

  file { '/etc/ssh/sshd_config':
    owner => root,
    group => root,
    mode  => '0600',
    noop  => $brsnoop,
  }

  augeas { 'sshd_config':
    context => '/files/etc/ssh/sshd_config',
    changes => [
      "set PermitRootLogin ${permit_root_login}",
      "set AllowTcpForwarding ${tcpforwarding}",
      "set PrintMotd ${printmotd}",
      "set PrintLastLog ${printlastlog}",
      ],
    noop    => $brsnoop,
  }

}
