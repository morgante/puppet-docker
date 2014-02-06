# Public: Configures directory nonsense
#
# Examples
#
#   include docker::config

class docker::config {
  require boxen::config

  $boot2dir		= "${boxen::config::datadir}/boot2docker"
  $boot2bin		= "${boxen::config::bindir}/boot2docker"
  $envfile		= "${boxen::config::envdir}/docker.sh"
}