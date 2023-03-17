#!/usr/bin/env bash

S6_URL="https://api.github.com/repos/just-containers/s6-overlay/releases"

FULL_LAST_VERSION=$(curl -SsL ${S6_URL} | \
              jq -r -c '.[] | select( .prerelease == false ) | .tag_name' |\
              head -1 \
              )
LAST_VERSION="${FULL_LAST_VERSION:1}"

if [ "${LAST_VERSION}" ];then 
  sed -i -e "s|S6_VERSION='.*'|S6_VERSION='${LAST_VERSION}'|" Dockerfile*
fi

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
