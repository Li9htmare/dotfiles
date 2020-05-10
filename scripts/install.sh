#!/usr/bin/env bash

set -o errexit
set -o nounset


if sudo -l mkdir &> /dev/null; then
    HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
else
    HOMEBREW_PREFIX=${HOME}/.linuxbrew
fi
export PATH=${HOME}/bin:${HOME}/.local/bin:${HOMEBREW_PREFIX}/bin:${PATH}


if ! type chezmoi &> /dev/null; then
    bash <( \
        curl --fail --location --silent --show-error \
            https://git.io/chezmoi \
    ) -b ${HOME}/bin
fi

if [[ ! -d ${HOME}/.dotfiles ]]; then
    chezmoi --source ${HOME}/.dotfiles init https://github.com/Li9htmare/dotfiles.git
fi
if ! chezmoi verify; then
    chezmoi diff
    echo 'Press any key to continue or Ctrl+C to abort'
    read -n 1 -s
    chezmoi apply
fi


if ! type brew &> /dev/null; then
    bash <( \
        curl --fail --location --silent --show-error \
            https://raw.githubusercontent.com/Homebrew/install/master/install.sh \
    )
fi

brew bundle --global --no-lock


if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm.git ${HOME}/.tmux/plugins/tpm
fi


# sudo apt install libbz2-dev
# sudo apt install libreadline-dev
# sudo apt install libsqlite3-dev
# sudo apt install libssl-dev
if ! type pyenv &> /dev/null; then
    bash <( \
        curl --fail --location --silent --show-error \
            https://pyenv.run \
    )
    ln --symbolic ${HOME}/.pyenv/bin/pyenv ${HOME}/bin/
fi


# sudo apt install python3-dev
# sudo apt install python3-pip
# sudo apt install python3-venv
if ! type pipx &> /dev/null; then
    pip3 install --user pipx
fi
pipx install black
pipx install flake8
pipx install glances
pipx install poetry

poetry config virtualenvs.in-project true
