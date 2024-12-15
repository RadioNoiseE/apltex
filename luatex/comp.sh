#!/bin/sh
set -e

if [ -f LOCK ]; then
    echo ":: directory locked, cleanup first"
    exit 0
fi

wkspc=`pwd`
parnt=$wkspc/..
flags=(
    --jithb
    --clang
    --parallel
)

git clone -b 1.17.0 --depth 1 https://gitlab.lisn.upsaclay.fr/texlive/luatex.git

cd luatex
cp $wkspc/texmf.in source/texk/kpathsea/texmf.cnf
./build.sh "${flags[@]}"

cp build-clang/texk/web2c/luajithbtex $parnt/texmf/web2c

cd $wkspc
touch LOCK
