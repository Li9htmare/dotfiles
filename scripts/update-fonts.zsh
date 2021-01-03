#!/usr/bin/env zsh

set -o errexit
set -o nounset

version='4.3.0'

mkdir --parents ~/.local/share/fonts
unzip -q \
    =(curl -fsSL https://github.com/be5invis/Iosevka/releases/download/v${version}/super-ttc-iosevka-ss09-${version}.zip) \
    -d ~/.local/share/fonts
fc-cache
