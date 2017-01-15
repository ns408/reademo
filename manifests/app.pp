class reademo::app (
)
{
  group {"web":
        ensure  => present,
        members => 'nginx',
        before => User['rea'],
      }
  user { "rea":
        ensure   => present,
        home     => '/var/www/rea/',
        gid   => 'web',
      }
  file { "/var/www":
    ensure => directory,
    mode => '0750',
    group => 'web',
  }
  file { "/var/www/rea":
    ensure => directory,
    owner => 'rea',
    group => 'web',
    mode  => '0750',
  }

  exec { "/bin/git clone https://github.com/rea-cruitment/simple-sinatra-app.git ./":
  cwd     => '/var/www/rea/',
  creates => '/var/www/rea/config.ru',
  user    => 'rea',
}


}
