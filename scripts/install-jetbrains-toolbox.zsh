#!/usr/bin/env zsh

set -o errexit
set -o nounset

alias curl='curl --location --show-error --silent'

readonly download_path=~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox
if [[ ! -x ${download_path} ]]; then
    mkdir --parents ${download_path:h}
    readonly latest_download_link=$(
        jq --raw-output \
            '.TBA[0].downloads.linux.link' \
            <(curl 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release')
    )
    tar --extract --file <(curl ${latest_download_link}) \
        --directory ${download_path:h} \
        --gzip \
        --strip-components 1
fi

if [[ ! ~/bin/jetbrains-toolbox -ef ${download_path} ]]; then
    ln --symbolic ${download_path} ~/bin/
fi
