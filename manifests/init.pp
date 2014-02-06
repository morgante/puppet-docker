# Public: Install docker with boot2docker
#
# Usage:
#
#   include docker

class docker {
  include docker::config

  repository { $docker::config::boot2dir:
    provider  => 'git',
    source    => 'steeve/boot2docker'
  }

  file { $docker::config::boot2bin:
    ensure    => link,
    mode      => 'ug+w',
    target    => "${docker::config::boot2dir}/boot2docker"
  }
}