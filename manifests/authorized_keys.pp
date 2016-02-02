class ssh::authorized_keys (
  $authorized_keys = $ssh::authorized_keys,
  $brsnoop         = $ssh::brsnoop,
) {

  if $authorized_keys {
    validate_hash($authorized_keys)
  }

  $defaults = {
    ensure => present,
    user   => 'root',
    #type   => 'ssh-rsa',
    noop   => $brsnoop,
  }

  create_resources(ssh_authorized_key, hiera_hash('ssh::authorized_keys'), $defaults)
  
}
