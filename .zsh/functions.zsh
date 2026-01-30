# Clear command not found output
command_not_found_handler() {
    print "$PWD"
}

# Fuzzy traverse folders
preexec() {
    which "${1%% *}" > /dev/null || nav $1
}

# Open nvim based on argv
v() {
    if [[ $# == 0 ]]; then
        nvim .
    else
        nvim $@
    fi
}

# Open tmux buffer in editor
edit-tmux-pane() {
    tmux capture-pane -p -S - |
        tr "" ">" |
        $EDITOR +'normal G{}b$' -R
}

# Cd in recursive fuzzy find
ss() {
    local dir="."
    [[ $# != 0 ]] && dir="$(nav -- "$@")"
    cd "$(find $dir -type d -not -path '*/.git/*' 2>/dev/null |
          fzf --preview 'echo -e "\033[1;31m{}\033[0m\n"; tag la {}')"
}

# Open config folder
open-config() {
    pushd ~/Repos/configs/ > /dev/null
    cd "$1"
    $EDITOR
    popd > /dev/null
}

# Show tree of git added files
gitree() {
    (   git ls-tree -r --name-only HEAD;
        git diff --cached --name-only --relative
    ) | sort -u \
      | tree --fromfile
}

# SSH keys
ssh-load() {
    [[ -z "$1" ]] && return 1
    local tmpfile=$(mktemp -t ssh-key.XXXXXX)
    print "$1" > "$tmpfile"
    chmod 600 "$tmpfile"
    ssh-add "$tmpfile"
    rm "$tmpfile"
}

# Make PDF from TeX
makepdf() {
    pdflatex main.tex > /dev/null
    pdflatex main.tex > /dev/null
    rm -rf *.aux *.log *.out *.toc *.fls _minted
}

