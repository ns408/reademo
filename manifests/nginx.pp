class reademo::ruby (
)
{
file { '/etc/nginx/conf.d/passenger.conf':
  ensure  => present,
  content => template('reademo/nginxpassenger.erb'),
  owner   => 'nginx',
  group   => 'nginx',
  mode    => '0644',
  notify  => Service['nginx'],
}

}
