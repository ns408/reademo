class reademo::ruby (
)
inherits reademo
{
  class { 'ruby':
    gems_version => $ruby_version,
      }
  class { 'ruby::dev': }


}
