#!/bin/sh -e

SCRIPTDIR=$(cd $(dirname $0) && cd _scripts && pwd)
CONFIG=$1

[ ! -z "$CONFIG" ] || echo "Need config passed as first argument!" >&2; exit 1

echo "- Installing bundled gems"
"${SCRIPTDIR}/bundle-install"

echo "- Running build-and-install with config '${CONFIG}'"
"${SCRIPTDIR}/run-with-config" "${CONFIG}" "${SCRIPTDIR}/build-and-install"

