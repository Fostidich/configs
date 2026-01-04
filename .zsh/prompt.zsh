# Interactive shell behavior
setopt IGNORE_EOF           # Prevent accidental Ctrl+D shell exit
setopt NULL_GLOB            # Non-matching globs return empty, not error
setopt INTERACTIVE_COMMENTS # Allow comments on interactive command line

# Enable and init ZSH completions
source "$HOME/.zsh/fzf-tab/fzf-tab.zsh" # Enable fuzzy completions menu on tab
eval "$(fzf --zsh)"                     # Enable fuzzy backward command search
fpath=(~/.zsh/completions $fpath)       # Prepend custom completion dir to search path
autoload -Uz compinit                   # Load ZSH command
compinit                                # Initialize completion system

# Shell syntax highlights
source ~/.zsh/syntax/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red,bold'

# Prompt color customization
c=$((RANDOM % 6 + 1))
PS1="%K{${c}}%F{#000} %2~ %k%F{${c}}%f "

