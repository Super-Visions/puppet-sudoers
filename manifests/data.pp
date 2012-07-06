#
# == Class: sudoers::data
#
# The sudoers::data class holds the defaults for all
# variables and parameters used in the sudoers class.
#
# === Parameters
#
# This class does not take parameters.
#
# === Variables
#
# [*sudoers_package*]
#   Default sudoers package name.
#
# [*sudoers_config_file*]
#   Default sudoers config dir.
#
# === Examples
#
#  class { 'sudoers::data': }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class sudoers::data {
  case $::operatingsystem
  {
    ubuntu, debian: {
      $sudoers_package     = 'sudo'
      $sudoers_config_file = '/etc'
    }
    centos, redhat: {
      $sudoers_package     = 'sudo'
      $sudoers_config_file = '/etc/sudoers'
    }
    default:
    {
      fail("Unknown OS: $::operatingsystem")
    }
  }
}
