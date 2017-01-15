class reademo::repo (
)
{
yumrepo {'epel':
ensure => present,
baseurl => $epel_repo,
enabled => true,
gpgcheck => false,
}
yumrepo {'passenger':
ensure => present,
baseurl => $passenger_repo,
enabled => true,
gpgcheck => false,
}

}
