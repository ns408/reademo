class reademo::install (
)
{
  package { 'passenger':
     ensure   => present,
    }
  package { 'nginx':
          ensure  => present,

        } -> # and then:
 service { 'nginx':
          enable  => true,
          ensure  => running,
        } -> # and then:
file { '/etc/nginx/conf.d/passenger.conf':
          ensure  => present,
          content => template('reademo/nginxpassenger.erb'),
          owner   => 'nginx',
          group   => 'nginx',
          mode    => '0644',
          notify  => Service['nginx'],
        }
}
