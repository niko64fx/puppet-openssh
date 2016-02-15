class openssh::config (
  $permit_root_login = $openssh::config_permit_root_login,
  $tcpforwarding     = $openssh::config_tcpforwarding,
  $printmotd         = $openssh::config_printmotd,
  $printlastlog      = $openssh::config_printlastlog,
  $if_noop           = $openssh::if_noop,
) {

  file { '/etc/ssh/sshd_config':
    owner => root,
    group => root,
    mode  => '0600',
    noop  => $if_noop,
  }

  augeas { 'sshd_config':
    context => '/files/etc/ssh/sshd_config',
    changes => [
      "set PermitRootLogin ${permit_root_login}",
      "set AllowTcpForwarding ${tcpforwarding}",
      "set PrintMotd ${printmotd}",
      "set PrintLastLog ${printlastlog}",
      ],
    noop    => $if_noop,
  }

}
