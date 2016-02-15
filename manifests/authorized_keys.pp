class openssh::authorized_keys (
  $authorized_keys = $openssh::authorized_keys,
  $if_noop         = $openssh::if_noop,
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

  create_resources(ssh_authorized_key, hiera_hash('openssh::authorized_keys'), $defaults)
  
}
