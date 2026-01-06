#!/bin/zsh

source "$HOME/.zsh/prompt.zsh"
source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/functions.zsh"

eval "$(leetcode completions)"
eval "$(zoxide init zsh)"

