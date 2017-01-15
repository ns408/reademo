# Class: REAdemo
# ===========================
#
# Full description of class REAdemo here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'REAdemo':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class reademo (
$ruby_version = 'latest',
$ruby_home = '/usr/bin/ruby',
$epel_repo = 'https://dl.fedoraproject.org/pub/epel/7/x86_64/',
$passenger_repo = 'https://oss-binaries.phusionpassenger.com/yum/passenger/el/$releasever/$basearch',
)
{
class { '::reademo::repo': } -> # and then:
class { '::reademo::ruby': } -> # and then:
class { '::reademo::install': } -> # and then:
class { '::reademo::nginx': }
class { '::reademo::app': }
}
