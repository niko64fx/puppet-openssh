#openssh

####Table of Contents
1. [Overview - What is the openssh module?](#overview)
2. [Module Description - What does the module do?](#module-description)
3. [Setup - The basics of getting started with ssh](#setup)
4. [Limitations - OS compatibility, etc.](#limitations)

##Overview

The openssh module allows you to set up the openssh server configuration, the known_hosts and the authorized_keys files.

##Module Description

The module can update the openssh server packages. It also updates the known_hosts file automatically and the authorized_keys using a hiera hash.

##Setup

**What openssh affects:**

* `/etc/ssh/sshd_config`
* `/etc/ssh/ssh_known_hosts`
* `authorized_keys`

###Beginning with openssh

Ssh is very easy to use.
The only sshd_config parameters you can manage at this time are:

* permit_root_login (`yes` by default)
* tcpforwarding (`no` by default)
* printmotd (`yes` by default)

```YAML
openssh::permit_root_login: 'yes'
openssh::tcpforwarding: 'no'
openssh::printmotd: 'yes'
```

If you want to add the ssh key of toto in the root authorized_keys, use this way:

```YAML
openssh::authorized_keys:
  'toto':
    type: 'ssh-rsa'
    key: 'AAAAB3NzaC1yc2EAAAADAQladlFfe+6f0qGILC2rvgVyVoswwQCK4Egvdj6AyuXdLl+WSYq5nZMedqmPdCV2SQh/6lBKHALmcUgvEkCMbO4tteIovfZKp89zuF8qROYmUBMF3ksSm3YEDSH3tyTXGDjb1YvnNXT50KjxWs4e55cy2aFAJOiBPxej3r+IHmjntPzOx5HWm3AnpiMSHqBCZ6T96THauFvQ+iAqOnSypwiObIYmVkzoylRXXcOpx9G0/1uaCEg+wUELIu0l9AICNZrWawLCwvECidcKx+Qh+BhlY7KtBZvv1krMcycBkQQENfHzopf7raGgmsCcDYyDVEHcx'
```
As you can see, the key is `ssh-rsa` type.

##Limitations

This module has been validated on:

* Debian:
    * 6.0.10 x86_64
    * 7.8 x86_64
* CentOS: 
    * 7.0 x86_64
