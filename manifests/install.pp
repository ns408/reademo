class reademo::install (
)
{
  package { 'passenger':
     ensure   => present,
    } -> # and then:
  package { 'nginx':
          ensure  => present,
        } -> # and then:
 service { 'nginx':
          enable  => true,
          ensure  => running,
}
