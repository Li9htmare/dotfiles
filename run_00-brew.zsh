#!/usr/bin/env zsh

set -o errexit
set -o nounset

readonly required_formulae=(
    bat
    black
    diff-so-fancy
    exa
    fd
    flake8
    fzf
    getantibody/tap/antibody
    git
    glances
    jq
    pipx
    pyenv
    ripgrep
    tmux
    yarn
    z
)
readonly installed_formulae=($(brew ls --full-name))
for formula in ${(ou)required_formulae:|installed_formulae}; do
    brew install ${formula}

    case ${formula} in
        fzf)
            $(brew --prefix)/opt/fzf/install --all
            ;;
    esac
done

brew upgrade
