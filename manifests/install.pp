class reademo::install (
)
inherits reademo
{
  package { 'passenger':
     ensure   => present,
    }
  package { 'nginx':
          ensure  => present,
        }
 service { 'nginx':
          enable  => true,
          ensure  => running,
          require => Package['nginx'],
        }
file { '/etc/nginx/conf.d/passenger.conf':
          ensure  => present,
          content => template('reademo/nginxpassenger.erb'),
          owner   => 'nginx',
          group   => 'nginx',
          mode    => '0644',
          notify  => Service['nginx'],
          require => Package['nginx'],
        }
file { '/etc/nginx/conf.d/rea.conf':
          ensure  => present,
          content => template('reademo/rea.erb'),
          owner   => 'nginx',
          group   => 'nginx',
          mode    => '0644',
          notify  => Service['nginx'],
          require => Package['nginx'],
        }
}
