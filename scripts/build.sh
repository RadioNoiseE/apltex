#!/bin/sh

set -euo pipefail

realpath() {
    oldpath=$(pwd)

    if ! cd "$1" >/dev/null 2>&1; then
        cd "${1##*/}" >/dev/null 2>&1
        echo $(pwd -P)/${1%/*}
    else
        pwd -P
    fi

    cd $oldpath > /dev/null 2>&1
}

cd "$(realpath $(dirname "$0"))/.."

if [ -z "${USERLAND:-}" ]; then
    case "$(uname)" in
        Linux) USERLAND=gnu ;;
        Darwin|*BSD) USERLAND=bsd ;;
    esac
fi

case "$USERLAND" in
    gnu|bsd) export USERLAND ;;
    *) echo "ERR: unsupported userland, aborting..." >&2 && exit 1 ;;
esac

if [ -z "${SYSTEM:-}" ]; then
    case "$(uname)" in
        Linux|*BSD) SYSTEM=unix ;;
        Darwin) SYSTEM=darwin ;;
    esac
fi

case "$SYSTEM" in
    unix|darwin) export SYSTEM ;;
    *) echo "ERR: unsupported system, aborting..." >&2 && exit 1 ;;
esac

[ -d texmf ] || mkdir texmf

cd luatex
./compile.sh
cd ..

cd web2c
./configure.sh
cd ..

cd amsfonts
./install.sh
cd ..

cd format
./dump.sh
cd ..
