# Public: Install docker with boot2docker
#
# Usage:
#
#   include docker

class docker(
	$boot2docker = 'https://raw.github.com/steeve/boot2docker/master/boot2docker'
) {
	include boxen::config

	file { "boot2docker":
		name	=> "${boxen::config::bindir}/boot2docker",
		ensure	=> present,
		source	=> "${boot2docker}",
		owner	=> root,
		group	=> wheel,
		mode	=> "ug+w"
	}
}