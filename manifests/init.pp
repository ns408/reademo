# Class: REAdemo
# ===========================
#
# Full description of class REAdemo here.
#
#
# Examples
# --------
#
# @example
#    class { 'REAdemo':  }
#
# Authors
# -------
#
# Author Name lnunns86@gmail.com
#
# Copyright
# ---------
#
# Copyright 2017 Liam Nunns, unless otherwise noted.
#
class reademo (
$ruby_version = 'latest',
$ruby_home = '/usr/bin/ruby',
$epel_repo = 'https://dl.fedoraproject.org/pub/epel/7/x86_64/',
$passenger_repo = 'https://oss-binaries.phusionpassenger.com/yum/passenger/el/$releasever/$basearch',
$server_binding = $fqdn,
)
{
class { '::reademo::repo': } -> # and then:
class { '::reademo::ruby': } -> # and then:
class { '::reademo::install': } -> # and then:
class { '::reademo::nginx': }
class { '::reademo::app': }
}
