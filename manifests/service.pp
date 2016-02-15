class openssh::service (
  $service_name    = $openssh::service_name,
  $service_ensure  = $openssh::service_ensure,
  $service_enabled = $openssh::service_enabled,
  $if_noop         = $openssh::if_noop,
) {

  service { $service_name:
    ensure => $service_ensure,
    enable => $service_enabled,
    noop   => $if_noop,
  }

}
