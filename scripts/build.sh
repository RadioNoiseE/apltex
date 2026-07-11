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

case "$(uname)" in
    Linux) export KERNEL=linux ;;
    Darwin) export KERNEL=darwin ;;
    *) echo "ERR: unsupported system, aborting..." >&2 && exit 1 ;;
esac

[ -d texmf ] || mkdir texmf

pushd luatex
./compile.sh
popd

pushd web2c
./configure.sh
popd

pushd amsfonts
./install.sh
popd

pushd format
./dump.sh
popd
