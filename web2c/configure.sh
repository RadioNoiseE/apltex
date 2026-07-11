#!/bin/sh

set -euo pipefail

if [ -f LOCK ]; then
    echo "WRN: directory locked, clean up first"
    exit 0
fi

case "$KERNEL" in
    linux) OSFONTDIR='/usr{/local,}/share/fonts//' ;;
    darwin) OSFONTDIR='{/System,}/Library/Fonts//' ;;
esac

cp texmf.cnf ../texmf/web2c
sed -i "/OSFONTDIR/ s|?|$OSFONTDIR|" ../texmf/web2c/texmf.cnf

touch LOCK
