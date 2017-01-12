class reademo::repo (
)
{
yumrepo {'epel':
ensure => present,
baseurl => 'https://dl.fedoraproject.org/pub/epel/7/x86_64/',
enabled => true,
gpgcheck => false,
}
yumrepo {'passenger':
ensure => present,
baseurl => 'https://oss-binaries.phusionpassenger.com/yum/passenger/el/$releasever/$basearch',
enabled => true,
gpgcheck => false,
}

}
