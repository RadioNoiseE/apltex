#!/bin/sh

set -euo pipefail

if [ -f LOCK ]; then
    echo "WRN: directory locked, clean up first"
    exit 0
fi

cp luatex.map ../texmf/web2c

mkdir ../texmf/fonts

cp -r tfm ../texmf/fonts
cp -r type1 ../texmf/fonts

touch LOCK
