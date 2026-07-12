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

rm -r texmf &
rm -rf luatex/{build,texlive*} &
rm format/{*.log,*.fmt} &
rm */LOCK
