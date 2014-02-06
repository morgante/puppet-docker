# Docker Puppet Module for Boxen

This module will install docker and boot2docker, enabling you to experiment with Docker on OS X, using Boxen.

## Usage

```puppet
include docker
```

You can start using Docker through the client by connecting to the basic [vm](steeve/boot2docker).

```
boot2docker up
docker version
```

## Required Puppet Modules

* `boxen`
* `virtualbox`
* `homebrew`

## Development

Set `GITHUB_API_TOKEN` in your shell with a [Github oAuth Token](https://help.github.com/articles/creating-an-oauth-token-for-command-line-use) to raise your API rate limit. You can get some work done without it, but you're less likely to encounter errors like `Unable to find module 'boxen/puppet-boxen' on https://github.com`.

Then write some code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.