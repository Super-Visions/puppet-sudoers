# Puppet Sudoers
[![Build Status](https://travis-ci.org/deric/puppet-sudoers.svg?branch=master)](https://travis-ci.org/deric/puppet-sudoers)

Module for managing sudoers file.

## Usage

`manifests/nodes.pp`:

```puppet
class {'sudoers': }
```

Hiera file e.g. `Debian.yaml`

```yaml
sudoers::package: 'sudo'
sudoers::rules:
  someuser:
    ensure: present
    nopasswd: 'true'
    commands: ls
  '%sudo':
    ensure: present # or absent
    commands: ALL
```

## License

[GNU-GPLv3](https://github.com/deric/puppet-sudoers/blob/master/GNU-GPL.txt)
