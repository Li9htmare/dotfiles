```
dnf install \
    # Build essentials
    cmake \
    gcc-c++ \
    # Alacritty dependencies
    fontconfig-devel \
    freetype-devel \
    libxcb-devel \
    # Tools
    git \
    tmux \
    zsh
```

```
# Install Homebrew
bash <( \
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh \
)

bash <( \
    curl -fsSL https://raw.githubusercontent.com/Li9htmare/dotfiles/master/scripts/install.sh \
)
```

```
sudo chsh -s /usr/bin/zsh
```
