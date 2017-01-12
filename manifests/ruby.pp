class reademo::ruby (
)
{
  class { 'ruby':
    gems_version => $ruby_version,
      }
  class { 'ruby::dev': }


}
