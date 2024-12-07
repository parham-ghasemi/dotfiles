# Created by newuser for 5.9

#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -latr'
# alias clear='clear; fastfetch --logo ~/.config/fastfetch/logo.txt'

# Prompt
PS1='[%n@%m %1~]$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# fastfetch with owl logo 
# fastfetch --logo ~/.config/fastfetch/logo.txt

# fastfetch with arch logo 
fastfetch --logo ~/.config/fastfetch/archLogo.txt

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zoxide
eval "$(zoxide init --cmd cd zsh)"
# Default editor
export EDITOR='nvim'

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starship prompt
eval "$(starship init zsh)"

# Ignore upper and lowercase when TAB completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# yazi change working directory when exiting
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(<"$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd "$cwd"
    fi
    rm -f -- "$tmp"
}

# zsh syntax highlighting
source ~/dotfiles/zshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh auto complete
fpath+=~/.zsh/zsh-completions/src
autoload -U compinit && compinit

source ~/dotfiles/zshplugins/zsh-autosuggestions/zsh-autosuggestions.zsh
