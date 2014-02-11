# Public: Install docker with boot2docker
#
# Usage:
#
#   include docker

class docker {
  include docker::config

  repository { 'boot2docker_repo':
    provider  => 'git',
    source    => 'steeve/boot2docker',
    path      => $docker::config::boot2dir
  }

  file { "symlink_boot2docker":
    path      => $docker::config::boot2bin,
    ensure    => link,
    mode      => 'ug+w',
    target    => "${docker::config::boot2dir}/boot2docker",
    require   => Repository["boot2docker_repo"]
  }

  exec { 'init vm':
    command   => "${docker::config::boot2bin} init",
    onlyif    => "${docker::config::boot2bin} status | grep -c 'does not exist'",
    require   => File["symlink_boot2docker"]
  }

  homebrew::tap { 'homebrew/binary':
    before    => Package['homebrew/binary/docker']
  }

  package { 'homebrew/binary/docker':
    require   => Homebrew::Tap['homebrew/binary']
  }

  file { $docker::config::envfile:
    content   => template('docker/env.sh.erb'),
    require   => File[$boxen::config::envdir]
  }
}