class ssh::authorized_keys (
  $authorized_keys = $ssh::authorized_keys,
  $if_noop         = $ssh::if_noop,
) {

  if $authorized_keys {
    validate_hash($authorized_keys)
  }

  $defaults = {
    ensure => present,
    user   => 'root',
    'type' => 'ssh-rsa',
    noop   => $if_noop,
  }

  create_resources(ssh_authorized_key, hiera_hash('ssh::authorized_keys'), $defaults)
  
}
