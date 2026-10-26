#!/bin/sh

set -euo pipefail

if [ -f LOCK ]; then
    echo "WRN: directory locked, clean up first"
    exit 0
fi

case "$USERLAND" in
    gnu) sed() { command sed -i "$@"; } ;;
    bsd) sed() { command sed -i '' "$@"; } ;;
esac

case "$SYSTEM" in
    unix) OSFONTDIR='/usr{/local,}/share/fonts//' ;;
    darwin) OSFONTDIR='{/System,}/Library/Fonts//' ;;
esac

cp texmf.cnf ../texmf/web2c
sed "/OSFONTDIR/ s|?|$OSFONTDIR|" ../texmf/web2c/texmf.cnf

touch LOCK
