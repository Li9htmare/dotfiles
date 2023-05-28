```
sudo chsh -s /usr/bin/zsh
```

## Iosevka Custom Build

### Build ttfautohint
```bash
curl -L -o ~/build/ttfautohint-build.sh \
    https://raw.githubusercontent.com/source-foundry/ttfautohint-build/v1.8.3.2/ttfautohint-build.sh

# User configuration:
BUILD=${HOME}/build/ttfautohint-build
INST=${HOME}/install/ttfautohint
```

### Build Iosevka
```bash
git clone --depth=1 \
    https://github.com/be5invis/Iosevka \
    ~/build/Iosevka
cd ~/build/Iosevka
npm install

ln -s ~/.local/share/chezmoi/manual/iosevka-private-build-plans.toml ./private-build-plans.toml
npm run build -- super-ttc::iosevka-li9htmare
mkdir -p ~/.local/share/fonts
cp ./dist/.super-ttc/iosevka-li9htmare.ttc ~/.local/share/fonts/
fc-cache -fv
```
