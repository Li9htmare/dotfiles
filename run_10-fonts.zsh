#!/usr/bin/env zsh

set -o errexit
set -o nounset

alias curl='curl --fail --location --show-error --silent'

readonly latest_tag=$(
    jq --raw-output \
        '.tag_name' \
        <(curl https://api.github.com/repos/be5invis/Iosevka/releases/latest)
)

for download_option in iosevka-ss09 iosevka-term-ss09; do
    local download_path=~/.local/share/fonts/${download_option}-${latest_tag#v}
    if [[ ! -d ${download_path} ]]; then
        mkdir --parents ${download_path:h}
        for old_download_path in $(
            fd --max-depth 1 --type d "^${download_option}-\d+\.\d+\.\d+$" ${download_path:h}
        ); do
            echo Removing ${old_download_path}
            rm --recursive ${old_download_path}
        done
        echo Downloading to ${download_path}
        unzip -jq \
            =(curl https://github.com/be5invis/Iosevka/releases/download/${latest_tag}/${download_path:t}.zip) \
            'ttf/*.ttf' \
            -d ${download_path}
        fc-cache
    fi
done

