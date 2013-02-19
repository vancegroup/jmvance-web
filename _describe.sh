#!/bin/bash -e

(
cd $(dirname $0)
if [ "$1" == "--apply" ]; then
  cp _config.yml _config.yml.bak
  cat >> _config.yml <<EOF
commitid: $(git log -n 1 --pretty=format:'%H')
commitlinktext: "$(git log -n 1 --pretty=format:'%h - %an, %aD - %s')"
commitdesc: "$(git log -n 1 --pretty=format:'%b')"
EOF
elif [ "$1" == "--unapply" ]; then
  mv _config.yml.bak _config.yml
else
  echo "Error - must pass --apply or --unapply !"
  exit 1
fi
)
