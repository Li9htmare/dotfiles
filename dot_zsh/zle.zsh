function set-cursor-shape {
    case $1 in
        BAR)
            echo -en '\x1b[6 q'
            ;;
        BLOCK)
            echo -en '\x1b[2 q'
            ;;
        UNDERLINE)
            echo -en '\x1b[4 q'
            ;;
    esac
}

function zle-keymap-select() {
    case ${KEYMAP} in
        main|viins)
            if [[ ${ZLE_STATE} == *overwrite* ]]; then
                set-cursor-shape 'UNDERLINE'
            else
                set-cursor-shape 'BAR'
            fi
            ;;
        vicmd)
            set-cursor-shape 'BLOCK'
            ;;
    esac
}
zle -N zle-keymap-select

function zle-line-init() {
    echoti smkx

    set-cursor-shape 'BAR'
}
zle -N zle-line-init

function zle-line-finish() {
    set-cursor-shape 'BLOCK'

    echoti rmkx
}
zle -N zle-line-finish

# Use `showkey --ascii` to examine the codes sent by the keyboard
bindkey '^[[3~' delete-char  # Delete
bindkey '^[[1~' beginning-of-line  # Home
bindkey '^[[4~' end-of-line  # End
bindkey '^[[1;5D' backward-word  # Ctrl+Left
bindkey '^[[1;5C' forward-word  # Ctrl+Right
bindkey '^[^?' undo  # Meta+Backspace

bindkey -v

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
