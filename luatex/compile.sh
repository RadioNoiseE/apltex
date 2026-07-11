#!/bin/sh

set -euo pipefail

if [ -f LOCK ]; then
    echo "WRN: directory locked, clean up first"
    exit 0
fi

release=20260301
options=(
    --disable-aleph
    --disable-all-pkgs
    --disable-bibtex8
    --disable-bibtexu
    --disable-euptex
    --disable-hitex
    --disable-luajithbtex
    --disable-luajittex
    --disable-mf
    --disable-mf-nowin
    --disable-mflua
    --disable-mfluajit
    --disable-mp
    --disable-native-texlive-build
    --disable-pdftex
    --disable-pmp
    --disable-tex
    --disable-texprof
    --disable-upmp
    --disable-xetex
    --enable-web2c
    --without-x
)

curl -fLO https://mirrors.ctan.org/systems/texlive/Source/texlive-$release-source.tar.xz
tar -xf texlive-$release-source.tar.xz
cp texmf.cnf texlive-$release-source/texk/kpathsea/texmf.cnf

mkdir build && pushd build
../texlive-$release-source/configure "${options[@]}" && make -j
popd

mkdir ../texmf/web2c
cp build/texk/web2c/luahbtex ../texmf/web2c/luatex
strip ../texmf/web2c/luatex

touch LOCK
