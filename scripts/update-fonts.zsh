#!/usr/bin/env zsh

set -o errexit
set -o nounset

alias curl='curl --fail --location --show-error --silent'

latest_tag=$(
    curl --head  --output /dev/null --write-out %{url_effective} \
        https://github.com/be5invis/Iosevka/releases/latest
)
latest_tag=${latest_tag:t}
echo ${latest_tag}

for download_option in iosevka-ss09 iosevka-term-ss09; do
    local download_path=~/.local/share/fonts/${download_option}-${latest_tag#v}
    if [[ ! -d ${download_path} ]]; then
        mkdir --parents ${download_path:h}
        for old_download_path in $(
            fd --max-depth 1 --type d "^${download_option}-" ${download_path:h}
        ); do
            echo Removing ${old_download_path}
            rm --recursive ${old_download_path}
        done
        echo Downloading ${download_path:t} to ${download_path:h}
        unzip -jq \
            =(curl https://github.com/be5invis/Iosevka/releases/download/${latest_tag}/${download_path:t}.zip) \
            'ttf/*.ttf' \
            -d ${download_path}
        fc-cache
    fi
done
