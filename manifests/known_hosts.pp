class ssh::known_hosts (
  $export_known_hosts  = $ssh::export_known_hosts,
  $realize_known_hosts = $ssh::realize_known_hosts,
  $if_noop             = $ssh::if_noop,
) {

  if $export_known_hosts {
    @@sshkey { "${::fqdn}_rsa":
      host_aliases => [$::fqdn, $::ipaddress],
      type         => rsa,
      key          => $::sshrsakey
    }
  }

  if $realize_known_hosts {
    Sshkey <<| |>> {
      noop => $if_noop,
    }
  }

}
