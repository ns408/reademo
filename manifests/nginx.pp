class reademo::nginx (
  )
  {
    service { 'nginx':
    enable  => true,
    ensure  => running,
  }

}
