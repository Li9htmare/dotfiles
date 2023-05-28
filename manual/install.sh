#!/bin/bash -eu

export PATH=~/.cargo/bin:~/.local/bin:${PATH}

mkdir -p ~/share/zsh/site-functions


if [[ ! -x ~/.cargo/bin/cargo ]]; then
    bash <(curl https://sh.rustup.rs -sSf) --no-modify-path
fi
cargo install bat
cargo install cargo-update
cargo install exa
cargo install fd-find
cargo install procs
cargo install ripgrep
cargo install zoxide

if ! type nvim &> /dev/null; then
    curl -fLo ~/bin/nvim https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod +x ~/bin/nvim
fi

if [[ ! -x ~/bin/pyenv ]]; then
    bash <(curl https://pyenv.run)
    ln -s ~/.pyenv/bin/pyenv ~/bin/
    ln -s ~/.pyenv/completions/pyenv.zsh ~/share/zsh/site-functions/_pyenv
fi

if [[ ! -f ~/.nvm/nvm.sh ]]; then
    git clone https://github.com/nvm-sh/nvm.git ~/.nvm
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
