class openssh::install (
  $package_name   = $openssh::package_name,
  $package_ensure = $openssh::package_ensure,
  $if_noop        = $openssh::if_noop,
) {

  package { $package_name:
    ensure => $package_ensure,
    noop   => $if_noop,
  }

}
