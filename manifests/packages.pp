class reademo::packages (
)
{


  package { 'passenger':
     ensure   => present,
    }
  package { 'nginx':
          ensure  => present,
        }
}
