#!/bin/zsh

# Zsh custom options
setopt IGNORE_EOF
setopt NULL_GLOB
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu yes select
zstyle ':completion:*' auto-description '%d'
bindkey '^I' menu-complete

# Prompt color customization
c=$((RANDOM % 6 + 1))
PS1="%K{${c}}%F{#000} %2~ %k%F{${c}}%f "

# Personal aliases
alias b='cd "$BACK"'
alias d='tag la'
alias l='tag ls'
alias q='exit'
alias v='nvim'
alias cl='clear && tmux clear-history 2>/dev/null'
alias ip='ipconfig getifaddr en0'
alias md='grip >/dev/null 2>&1 -b'
alias img='kitty icat'
alias act='source (.||_)venv/bin/activate'
alias src='source ~/.zshrc'
alias tsrc='tmux source ~/.config/tmux/tmux.conf'
alias path='echo $PATH | tr : "\n"'
alias clip='pbcopy'
alias aconfig='open-config alacritty'
alias gconfig='open-config ghostty'
alias vconfig='open-config nvim'
alias tconfig='open-config tmux'
alias zconfig='nvim ~/.zshrc'
alias pconfig='nvim ~/.zprofile'

# Open config folder
open-config() {
    pushd ~/.config/ > /dev/null
    cd "$1"
    nvim
    popd > /dev/null
}

# Show tree of git added files
gitree() {
    (git ls-tree -r --name-only HEAD; \
        git diff --cached --name-only --relative) \
        | sort -u \
        | tree --fromfile
    }

# SSH keys
ssh-load() {
    [[ -z "$1" ]] && return 1
    local tmpfile=$(mktemp -t ssh-key.XXXXXX)
    echo "$1" > "$tmpfile"
    chmod 600 "$tmpfile"
    ssh-add "$tmpfile"
    rm "$tmpfile"
}

# Launch program detached
ind() {
    nohup "$@" >/dev/null 2>/dev/null &
}

# Make PDF from TeX
makepdf() {
    pdflatex main.tex > /dev/null
    pdflatex main.tex > /dev/null
    rm -rf *.aux *.log *.out *.toc *.fls _minted
}

# Fast copy
fcp() {
    cp "$1" $(${@:2} && pwd)
}

# Fast move
fmv() {
    mv "$1" $(${@:2} && pwd)
}

# Folder navigation
nav() {
    setopt NO_CASE_GLOB
    for arg in "$@"; do
        for dir in ./"$arg"*; do
            if [ -d "$dir" ]; then
                cd -q "$dir"
                break
            fi
        done
    done
    cd .
}

# Back navigation
export BACK="$(pwd)"
export CURR="$(pwd)"

chpwd() {
    export BACK="$CURR"
    export CURR="$(pwd)"
}

# Home
export HM=~

hm() {
    cd -q $HM
    nav "$@"
}

# Documents
export DC=~/Documents

dc() {
    cd -q $DC
    nav "$@"
}

# Downloads
export DW=~/Downloads

dw() {
    cd -q $DW
    nav "$@"
}

# Repos
export RP=~/Documents/Repos

rp() {
    cd -q $RP
    nav "$@"
}

# iCloud
export IC=~/iCloud

ic() {
    cd -q $IC
    nav "$@"
}

