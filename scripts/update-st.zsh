#!/usr/bin/env zsh

set -o errexit
set -o nounset

build_path=~/build/st
if [[ ! -d ${build_path} ]]; then
    git clone --depth 1 https://github.com/LukeSmithxyz/st ${build_path}
fi

cd ${build_path}
git fetch
if [[ $(git merge-base master origin/master) != $(git rev-parse origin/master) ]]; then
    git pull
    if [[ -f /usr/lib/x86_64-linux-gnu/pkgconfig/fontconfig.pc ]]; then
        export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
    fi
    make PREFIX=~/install/st install
fi
