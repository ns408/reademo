class reademo::install (
)
inherits reademo
{
  package { 'passenger':
     ensure   => present,
    }
    group { "web":
          ensure  => present,
        }
    user { "nginx":
          ensure   => present,
          groups    => 'web',
         }
  package { 'nginx':
          ensure  => present,
          require => User['nginx'],
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
file { '/etc/nginx/conf.d/buffer.conf':
          ensure  => present,
          content => template('reademo/buffer.erb'),
          owner   => 'nginx',
          group   => 'nginx',
          mode    => '0644',
          notify  => Service['nginx'],
          require => Package['nginx'],
                }
}
