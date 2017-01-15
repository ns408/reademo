class reademo::app (
)
{
  group {"web":
        ensure  => present,
      }
  user { "rea":
        ensure   => present,
        home     => '/var/www/rea/',
        groups   => 'web',
      }
  file { "/var/www":
    ensure => directory,
    mode => '0750',
    group => 'web',
  }
  file { "/var/www/rea":
    ensure => directory,
    owner => 'rea',
    mode  => '0700',
  }
  exec { "/bin/git clone https://github.com/rea-cruitment/simple-sinatra-app.git ./":
  cwd     => '/var/www/rea/',
  creates => '/var/www/rea/config.ru',
  user    => 'rea',
}


}
