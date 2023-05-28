#!/bin/bash -eu

mkdir -p ~/bin
mkdir -p ~/share/zsh/site-functions


if [[ ! -x ~/.cargo/bin/cargo ]]; then
    sh <(curl -sSf https://sh.rustup.rs) \
        --no-modify-path
fi
export PATH=~/.cargo/bin:${PATH}
cargo install bat
cargo install cargo-update
cargo install exa
cargo install fd-find
cargo install procs
cargo install ripgrep
cargo install zoxide

if [[ ! -x ~/bin/nvim ]]; then
    curl -fL -o ~/bin/nvim \
        https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod +x ~/bin/nvim
fi

if [[ ! -x ~/bin/kitty ]]; then
    sh <(curl -L https://sw.kovidgoyal.net/kitty/installer.sh) \
        launch=n
    ln -s ~/.local/kitty.app/bin/kitty ~/bin/
fi

if [[ ! -d ~/.nvm ]]; then
    git clone https://github.com/nvm-sh/nvm.git ~/.nvm
fi

if [[ ! -x ~/bin/pyenv ]]; then
    bash <(curl https://pyenv.run)
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
# pipx install poetry

# poetry config virtualenvs.in-project true
