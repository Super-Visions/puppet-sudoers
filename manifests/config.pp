#
# == Class: sudoers::config
#
# The sudoers::config class takes care of creating the sudoers.conf file
# and putting it in the correct place on the filesystem
#
# === Parameters
#
#   The defaults are fetched via hiera from sudoers::data.
#   They can also be set in any other hiera data file.
#
# [*sudoers_config_file*]
#   The file to manage.
#
# [*sudoers_rules*]
#   Hash of sudoers rules.
#
# === Variables
#
# No variables are used in the sudoers base class
#
# === Examples
#
#  class { 'sudoers::config': }
# 
# === Hiera
#
#sudoers_rules:
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
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class sudoers::config(
  $sudoers_config_file = hiera('sudoers_config_file'),
  $sudoers_rules       = hiera('sudoers_rules', {}),
)
{
  if( $sudoers_rules )
  {
    create_resources( sudoers, $sudoers_rules )
  }
}
