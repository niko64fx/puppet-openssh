class ssh::service (
  $service_name    = $ssh::service_name,
  $service_ensure  = $ssh::service_ensure,
  $service_enabled = $ssh::service_enabled,
  $brsnoop         = $ssh::brsnoop,
) {

  service { $service_name:
    ensure => $service_ensure,
    enable => $service_enabled,
    noop   => $brsnoop,
  }

}
