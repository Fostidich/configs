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

