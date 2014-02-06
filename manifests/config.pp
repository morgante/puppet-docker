# Public: Configures directory nonsense
#
# Examples
#
#   include docker::config

class docker::config {
  require boxen::config

  $boot2dir		= "${boxen::config::datadir}/boot2docker"
  $boot2bin		= "${boxen::config::bindir}/boot2docker"
  $url			= 'http://get.docker.io/builds/Darwin/x86_64/docker-latest'
  $bin			= "${boxen::config::bindir}/docker"
}