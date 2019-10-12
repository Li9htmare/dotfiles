#!/usr/bin/env zsh

set -o errexit
set -o nounset

alias curl='curl --location --show-error --silent'

latest_version=$(
    jq --raw-output \
        '.tag_name' \
        <(curl https://api.github.com/repos/neovim/neovim/releases/latest)
)

nvim_path=~/bin/nvim
if [[ -x ${nvim_path} ]]; then
    readonly installed_version=$(
        cut --delimiter ' ' --fields 2 <(head -1 <(${nvim_path} --version))
    )
else
    readonly installed_version=''
fi

if [[ ${latest_version} != ${installed_version} ]]; then
    curl https://github.com/neovim/neovim/releases/download/${latest_version}/nvim.appimage \
        --output ${nvim_path}
    chmod +x ${nvim_path}
fi
