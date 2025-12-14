#!/usr/bin/env bash

DEBIAN_URL="http://ftp.be.debian.org/debian/dists/trixie/Release"

LAST_VERSION=$(curl -SsL ${DEBIAN_URL} | grep "Version:" | awk '{print $2}')

if [ "${LAST_VERSION}" ];then
  sed -i -e "s|FROM debian:.*|FROM debian:${LAST_VERSION}|" Dockerfile*
fi

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else
  # Uncommitted changes
  git commit -a -m "rebased to Debian Linux  version: ${LAST_VERSION}"
  git push
fi
