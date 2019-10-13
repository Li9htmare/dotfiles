#!/usr/bin/env bash

set -o errexit
set -o nounset

if [[ ! -x /home/linuxbrew/.linuxbrew/bin/brew ]] \
        && [[ ! -x ~/.linuxbrew/bin/brew ]]; then
    sh -c "$(
        curl --fail --location --silent --show-error \
            https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh
    )"
fi

if [[ -d /home/linuxbrew/.linuxbrew ]]; then
    HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
else
    HOMEBREW_PREFIX=~/.linuxbrew
fi

export PATH=${HOMEBREW_PREFIX}/bin:${PATH}

brew install \
    twpayne/taps/chezmoi \
    zsh

[[ -d ~/.dotfiles ]] || chezmoi --source ~/.dotfiles init git@github.com:Li9htmare/dotfiles.git
chezmoi diff
echo 'Press any key to continue or Ctrl+C to abort'
read -n 1 -s
chezmoi apply
