#!/usr/bin/env zsh

set -o errexit
set -o nounset

build_path=~/build/st
if [[ ! -d ${build_path} ]]; then
    git clone https://github.com/LukeSmithxyz/st.git ${build_path}
    cd ${build_path}
    git reset --hard HEAD~1
fi

cd ${build_path}
git fetch
if [[ $(git merge-base master origin/master) != $(git rev-parse origin/master) ]]; then
    git pull
    if [[ -f /usr/lib64/pkgconfig/fontconfig.pc ]]; then
        export PKG_CONFIG_PATH=/usr/lib64/pkgconfig
    fi
    # sudo apt install libxft-dev
    make PREFIX=~/install/st install
    ln --symbolic ~/install/st/bin/st ~/bin/
fi
