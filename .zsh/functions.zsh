# Clear command not found output
command_not_found_handler() { }

# Fuzzy traverse folders
preexec() {
    which "${1%% *}" > /dev/null || nav $1
}

# Open tmux buffer in editor
edit-tmux-pane() {
    local tmp=$(mktemp)
    tmux capture-pane -p -S - | tr "" ">" > "$tmp"
    $EDITOR +'normal G{}b$' "$tmp"
    rm "$tmp"
}

# Open config folder
open-config() {
    pushd ~/.config/ > /dev/null
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
    echo "$1" > "$tmpfile"
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

