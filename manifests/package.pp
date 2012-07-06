#
# == Class: sudoers::package
#
# The sudoers::package class takes care of installing the sudoers package as needed
#
# === Parameters
#
#   The defaults are fetched via hiera from sudoers::data.
#   They can also be set in any other hiera data file.
#
# [*package_name*]
#   This parameter specifies the name of the package to install.
#
# === Variables
#
# No variables are used in the sudoers base class
#
# === Examples
#
#  class { 'sudoers::package': }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class sudoers::package( $package_name = hiera('sudoers_package') )
{
  package { $package_name:
    ensure => installed,
  }
}
