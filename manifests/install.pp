class ssh::install (
  $package_name   = $ssh::package_name,
  $package_ensure = $ssh::package_ensure,
  $if_noop        = $ssh::if_noop,
) {

  package { $package_name:
    ensure => $package_ensure,
    noop   => $if_noop,
  }

}
