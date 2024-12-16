#!/bin/sh
set -e

realpath()
{
    oldpath=`pwd`
    if ! cd $1 > /dev/null 2>&1; then
        cd ${1##*/} > /dev/null 2>&1
        echo $( pwd -P )/${1%/*}
    else
        pwd -P
    fi
    cd $oldpath > /dev/null 2>&1
}

cd "$(realpath $(dirname "$0"))/.."

mkdir texmf
mkdir texmf/web2c
mkdir texmf/fonts

cd luatex
./comp.sh
cd ..

cd web2c
./init.sh
cd ..

cd amsfonts
./font.sh
cd ..

cd fmtdump
./dump.sh
cd ..
