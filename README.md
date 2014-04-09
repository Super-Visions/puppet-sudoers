# Puppet module: sudoers

Module for mamaging sudoers file.

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
