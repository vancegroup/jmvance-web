#!/bin/bash -e

(
cd $(dirname $0)
if [ "$1" == "--apply" ]; then
  cp _config.yml _config.yml.bak
  cat >> _config.yml <<EOF
commitid: $(git describe --always)
commitlinktext: "$(git log -n 1 --pretty=format:'%h - %an, %ar.')"
commitdesc: "$(git log -n 1 --pretty=format:'%B')"
EOF
elif [ "$1" == "--unapply" ]; then
  mv _config.yml.bak _config.yml
else
  echo "Error - must pass --apply or --unapply !"
  exit 1
fi
)
