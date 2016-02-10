class ssh::service (
  $service_name    = $ssh::service_name,
  $service_ensure  = $ssh::service_ensure,
  $service_enabled = $ssh::service_enabled,
  $if_noop         = $ssh::if_noop,
) {

  service { $service_name:
    ensure => $service_ensure,
    enable => $service_enabled,
    noop   => $if_noop,
  }

}
