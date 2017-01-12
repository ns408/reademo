class reademo (
$ruby_version = 2.2.4,
)
{

class { '::reademo::repo': } -> # and then:
class { '::reademo::ruby': } -> # and then:
class { '::reademo::install': } -> # and then:
class { '::reademo::nginx': }
}
