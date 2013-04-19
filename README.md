# Puppet module: sudoers

This is the sudoers module.

This is based on https://github.com/windowsrefund/puppet-sudoers

## Usage

`manifests/nodes.pp`:

    class {'sudoers': }


Hiera file e.g. `Debian.yaml`
 
    sudoers_package: 'sudo'
    sudoers_config_file: '/etc/sudoers'
    sudoers_rules:
      someuser:
        ensure: present
        nopasswd: 'true'
        commands: ls
      '%sudo':
        ensure: present # or absent
        commands: ALL


## License

[GNU-GPLv3](https://github.com/deric/puppet-sudoers/blob/master/GNU-GPL.txt)

## Contact


Super-Visions

Pathoekeweg 120 b bus 1.07
8000 Brugge
tel: +32 50 68 55 58
mail: info@super-visions.com

http://super-visions.com

## Support


Please log tickets and issues at https://github.com/Super-Visions/puppet-sudoers
