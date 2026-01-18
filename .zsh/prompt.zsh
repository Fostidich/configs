# Load/enable ZSH commands
autoload -U compinit
autoload -U edit-command-line

# Interactive shell behavior
setopt NULL_GLOB            # Non-matching globs return empty, not error
setopt INTERACTIVE_COMMENTS # Allow comments on interactive command line
setopt HIST_IGNORE_SPACE    # Commands starting with space not added to history
setopt RE_MATCH_PCRE        # Enable PCRE regex recognition

# When tabbing, expand case insensitive and matching substrings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'

# Include custom completions
fpath=(~/.zsh/completions $fpath)

# Enable and init ZSH completions system (order sensitive)
compinit

# Load FZF keybindings (e.g. C-r, C-t)
eval "$(fzf --zsh)"

# On multiple match, when tabbing, use FZF (not builtin cycle list)
source ~/.zsh/fzf-tab/fzf-tab.zsh

# Fix a default editor
export EDITOR=nvim

# Add and bind widgets
zle -N edit-tmux-pane          # Open the history of the tmux pane inside a
bindkey '^V' edit-tmux-pane    # nvim buffer, with C-v.
zle -N edit-command-line       # Open the current command line in a nvim buffer
bindkey '^E' edit-command-line # being able to edit it, with C-e.

# Prompt color customization
c=$((RANDOM % 6 + 1))
PS1="%K{${c}}%F{#000} %2~ %k%F{${c}}%f "

# Shell syntax highlights plugin
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main regexp)
ZSH_HIGHLIGHT_REGEXP+=( '(?<=\s|^)\S*://\S*(?=\s|$)' fg=blue )
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

