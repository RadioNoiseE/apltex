#!/bin/sh

set -euo pipefail

if [ -f LOCK ]; then
    echo "WRN: directory locked, clean up first"
    exit 0
fi

case "$KERNEL" in
    linux)
        SEDINLINE=(sed -i)
        OSFONTDIR='/usr{/local,}/share/fonts//'
        ;;
    darwin)
        SEDINLINE=(sed -i '')
        OSFONTDIR='{/System,}/Library/Fonts//'
        ;;
esac

cp texmf.cnf ../texmf/web2c
"${SEDINLINE[@]}" "/OSFONTDIR/ s|?|$OSFONTDIR|" ../texmf/web2c/texmf.cnf

touch LOCK
