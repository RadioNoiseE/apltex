#!/bin/sh

set -euo pipefail

if [ -f LOCK ]; then
    echo "WRN: directory locked, clean up first"
    exit 0
fi

export PATH=$(pwd)/../texmf/web2c:"$PATH"

luatex -ini luatex.ini
cp luatex.fmt ../texmf/web2c

touch LOCK
