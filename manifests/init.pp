# Public: Install docker with boot2docker
#
# Usage:
#
#   include meteorjs

class docker(
  $boot2docker = 'https://raw.github.com/steeve/boot2docker/master/boot2docker'
) {
  include boxen::config

  anchor { 'Docker is here': }
}