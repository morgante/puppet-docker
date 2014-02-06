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

  file { "symlink_boot2docker":
    path      => $docker::config::boot2bin,
    ensure    => link,
    mode      => 'ug+w',
    target    => "${docker::config::boot2dir}/boot2docker"
  }

  exec { 'init vm':
    command   => "${docker::config::boot2bin} init"
  }

  homebrew::tap { 'homebrew/binary':
     before => Package['boxen/brews/docker']
  }

  package { 'boxen/brews/docker':
    ensure    => 'docker'
  }
}