# Created by newuser for 5.4.2

# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi
#
# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#	exec startx
#fi

#source ~/.aliases

#(cat ~/.cache/wal/sequences &)
#cat ~/.cache/wal/sequences
#source ~/.cache/wal/colors-tty.sh

# import the colors
#. "${HOME}/.cache/wal/colors.sh"

# custom commands
#bindkey -v
#bindkey '^R' history-incremental-search-backward

#function mk {
#	command mkdir $1 && cd $1
#}

#precmd() { print "" }


source ~/.aliases

# custom commands
bindkey -v
binkey '^R' history-incremental-search-backward

precmd() { print "" }
POWERLEVEL9K_MODE='nerdfont-complete'
source ~/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# anaconda
export PATH=~/anaconda3/bin:$PATH

# terminal colors
expoert TERM="xterm-256color"

tmux
