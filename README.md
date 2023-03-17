[![auto-update](https://github.com/digrouz/docker-debian-s6/actions/workflows/auto-update.yml/badge.svg)](https://github.com/digrouz/docker-debian-s6/actions/workflows/auto-update.yml)
[![update-debian](https://github.com/digrouz/docker-debian-s6/actions/workflows/update-debian.yml/badge.svg)](https://github.com/digrouz/docker-debian-s6/actions/workflows/update-debian.yml)
[![dockerhub](https://github.com/digrouz/docker-debian-s6/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/digrouz/docker-debian-s6/actions/workflows/dockerhub.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/digrouz/debian-s6)

# docker-debian-s6
Docker base image based on Debian Linux and s6-overlay


## Tag
Several tag are available:
* latest: [Dockerfile_debian](https://github.com/digrouz/docker-debian-s6/blob/master/Dockerfile_debian)

## Description

The Debian Project is an association of individuals, sharing a common goal: We want to create a free operating system, freely available for everyone. Now, when we use the word "free", we're not talking about money, instead, we are referring to software freedom.

https://www.debian.org/
https://github.com/just-containers/s6-overlay

## Usage
    docker create --name=debian-s6 \
      -e UID=<UID default:12345> \
      -e GID=<GID default:12345> \
      -e AUTOUPGRADE=<0|1 default:0> \
      -e TZ=<timezone default:Europe/Brussels> \
      digrouz/debian-s6

## Environment Variables

When you start the `debian-s6` image, you can adjust the configuration of the `debian-s6` instance by passing one or more environment variables on the `docker run` command line.

### `UID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `12345`.

### `GID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `12345`.

### `AUTOUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

### `TZ`

This variable is not mandatory and specifies the timezone to be configured within the container. It has default value `Europe/Brussels`.

## Notes

* This container is built using [s6-overlay](https://github.com/just-containers/s6-overlay)
* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e AUTOUPGRADE=1` at container creation.

## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-debian-s6/issues)
