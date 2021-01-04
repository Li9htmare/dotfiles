#!/usr/bin/env bash

set -o errexit
set -o nounset


export PATH=~/bin:${PATH}:~/.cargo/bin:~/.local/bin

mkdir -p ~/share/zsh/site-functions


if [[ ! -x ~/bin/chezmoi ]]; then
    bash <(curl -fsSL https://git.io/chezmoi) -b ~/bin
    chezmoi completion zsh --output ~/share/zsh/site-functions/_chezmoi
fi

if [[ ! -d ~/.dotfiles ]]; then
    chezmoi --source ~/.dotfiles init https://github.com/Li9htmare/dotfiles.git
fi
if ! chezmoi verify; then
    chezmoi diff
    echo 'Press any key to continue or Ctrl+C to abort'
    read -n 1 -s
    chezmoi apply
fi


if [[ -d /home/linuxbrew/.linuxbrew ]]; then
    HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
elif [[ -d ~/.linuxbrew ]]; then
    HOMEBREW_PREFIX=~/.linuxbrew
else
    echo 'Please install linuxbrew first'
    exit 1
fi
${HOMEBREW_PREFIX}/bin/brew bundle --global --no-lock


if [[ ! -x ~/.cargo/bin/cargo ]]; then
    bash <(curl -fsSL https://sh.rustup.rs) --no-modify-path
fi
cargo install alacritty
cargo install bat
cargo install exa
cargo install fd-find
cargo install lsd
cargo install procs
cargo install ripgrep


if ! type pyenv &> /dev/null; then
    bash <(curl -fsSL https://pyenv.run)
    ln -s ~/.pyenv/bin/pyenv ~/bin/
    ln -s ~/.pyenv/completions/pyenv.zsh ~/share/zsh/site-functions/_pyenv
fi


# sudo apt install python3-dev
# sudo apt install python3-pip
# sudo apt install python3-venv
# if ! type pipx &> /dev/null; then
#     pip install --user pipx
# fi
# pipx install black
# pipx install flake8
# pipx install glances
# pipx install poetry

# poetry config virtualenvs.in-project true
