class ssh::install (
  $package_name   = $ssh::package_name,
  $package_ensure = $ssh::package_ensure,
  $brsnoop        = $ssh::brsnoop,
) {

  package { $package_name:
    ensure => $package_ensure,
    noop   => $brsnoop,
  }

}
