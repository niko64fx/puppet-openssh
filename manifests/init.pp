class ssh (
  $package_ensure           = installed,
  $package_name             = 'openssh-server',
  $config_permit_root_login = 'yes',
  $config_tcpforwarding     = 'no',
  $config_printmotd         = 'yes',
  $config_printlastlog      = 'yes',
  $service_name             = undef,
  $service_ensure           = running,
  $service_enabled          = true,
  $authorized_keys          = undef,
  $export_known_hosts       = true,
  $realize_known_hosts      = true,
  $if_noop                  = $::clientnoop,
) {

  class{'::ssh::install': } ->
  class{'::ssh::config': }  ~>
  class{'::ssh::service': } ->
  Class['ssh']

}
