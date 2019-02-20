# Created by newuser for 5.4.2

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

source ~/.aliases

# custom commands
bindkey -v
bindkey '^R' history-incremental-search-backward

precmd() { print "" }
POWERLEVEL9K_MODE='nerdfont-complete'
source ~/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# anaconda
export PATH=~/anaconda3/bin:$PATH

# terminal colors
export TERM="xterm-256color"

