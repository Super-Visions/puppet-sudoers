#
# == Class: sudoers
#
# The sudoers class manges the /etc/sudoers file
#
# === Examples
#
#  class { sudoers: }
#
# === Hiera
#sudoers::rules:
#  someuser:
#    ensure: present
#    nopasswd: 'true'
#    commands: ls
#  '%agroup':
#    ensure: absent
#    nopasswd: 'false'
#    commands: ALL
#
# === Authors
#
class sudoers(
  $package = undef,
  $ensure  = 'present',
  $rules   = {}
)
{
  validate_hash($rules)

  anchor { 'sudoers::start': }

  if $package == undef {
    case $::operatingsystem {
      ubuntu, debian: {
        $package     = 'sudo'
        $config_file = '/etc/sudoers'
      }
      centos, redhat: {
        $package     = 'sudo'
        $config_file = '/etc/sudoers'
      }
      default: {
        fail("Unknown OS: $::operatingsystem, you have to specify $package param")
      }
    }
  }

  package { $package:
    ensure  => $ensure,
    require => Anchor['sudoers::start']
  }

  if($rules) {
    create_resources(sudoers, $rules, {
      'require' => Package[$package],
      'before'  => Anchor['sudoers::end']
    })
  }

  anchor { 'sudoers::end': }
}
