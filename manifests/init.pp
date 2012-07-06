#
# == Class: sudoers
#
# The sudoers class manges the /etc/sudoers file based on data stored in hiera
#
# === Parameters
#
# This class does not take parameters as all parameters are fetched via hiera
# The parameter defaults are stored in the sudoers::data class
#
# === Variables
#
# No variables are used in the sudoers base class
#
# === Examples
#
#  class { sudoers: }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class sudoers
{
  anchor { 'sudoers::start': }->
  class { 'sudoers::package': }->
  class { 'sudoers::config': }->
  anchor { 'sudoers::end': }
}
