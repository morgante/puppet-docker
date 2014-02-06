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

  exec { 'install_docker':
    command   => "curl -o ${docker::config::bin} ${docker::config::url}",
    creates   => $docker::config::bin
  }

  file { $docker::config::bin:
    mode      => 'ug+w',
    require   => Exec["retrieve_docker"]
  }
}