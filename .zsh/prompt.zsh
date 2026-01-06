# Interactive shell behavior
setopt NULL_GLOB            # Non-matching globs return empty, not error
setopt INTERACTIVE_COMMENTS # Allow comments on interactive command line
setopt HIST_IGNORE_SPACE    # Commands starting with space are not added to history
setopt RE_MATCH_PCRE        # Enable PCRE regex recognition

# Enable and init ZSH completions
source "$HOME/.zsh/fzf-tab/fzf-tab.zsh" # Enable fuzzy completions menu on tab
eval "$(fzf --zsh)"                     # Enable fuzzy backward command search
fpath=(~/.zsh/completions $fpath)       # Prepend custom completion dir to search path
autoload -Uz compinit                   # Load ZSH command
compinit                                # Initialize completion system

# Prompt color customization
c=$((RANDOM % 6 + 1))
PS1="%K{${c}}%F{#000} %2~ %k%F{${c}}%f "

# Shell syntax highlights
source ~/.zsh/syntax/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main regexp)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_REGEXP+=( '(?<=\s|^)\S*://\S*(?=\s|$)' fg=blue )

