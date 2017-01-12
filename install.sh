#!/bin/bash

if [[ $USER != "root" ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Determining Red Hat Version and creating Puppet Repository file"
if /bin/grep -q 7 /etc/redhat-release
then
sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
elif /bin/grep -q 6 /etc/redhat-release
then
sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
elif /bin/grep -q 5 /etc/redhat-release
then
sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-5.noarch.rpm
else
echo "Unsupported Operating system, please use CentOS/Red Hat 5/6/7"
exit 1
fi
echo "installing puppet agent via yum"
yum install puppet-agent
echo "installing git client"
yum install git
