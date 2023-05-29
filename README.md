```
sudo chsh -s /usr/bin/zsh
```

## Init

#### Chezmoi
```bash
sh <(curl -fsLS get.chezmoi.io) -b ${HOME}/bin
chezmoi init --apply Li9htmare
```

## Iosevka Custom Build

#### Install ttfautohint
```bash
sudo dnf install ttfautohint
```

#### Build Iosevka
```bash
git clone --depth=1 \
    https://github.com/be5invis/Iosevka \
    ~/build/Iosevka
cd ~/build/Iosevka
npm install

ln -s $(chezmoi source-path)/manual/iosevka-private-build-plans.toml ./private-build-plans.toml
npm run build -- super-ttc::iosevka-li9htmare
mkdir -p ~/.local/share/fonts
cp ./dist/.super-ttc/iosevka-li9htmare.ttc ~/.local/share/fonts/
fc-cache -fv
```

## Rofi

### Dependencies
```
sudo dnf config-manager --set-enabled crb

# Building
sudo dnf install \
    check-devel

# External libs
sudo dnf install \
    gdk-pixbuf2-devel \
    glib2-devel \
    libxcb-devel \
    libxkbcommon-devel \
    libxkbcommon-x11-devel \
    pango-devel \
    startup-notification-devel \
    xcb-util-devel \
    xcb-util-cursor-devel \
    xcb-util-wm-devel
```

## Keyboard Shortcuts

#### Home folder
- Shortcut: `Super+E`

#### Rofi
- Command: `${HOME}/bin/rofi -show`
- Shortcut: `Super+W`

#### Kitty
- Command: `${HOME}/bin/kitty`
- Shortcut: `Super+T`


## JetBrains Plugins

#### PyCharm
- .ignore
- CSV Editor
- IdeaVim
- Nord
