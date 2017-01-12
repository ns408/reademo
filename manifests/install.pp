class reademo::install (
)
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
        }
}
