# Created by newuser for 5.4.2

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

source ~/.aliases

(cat ~/.cache/wal/sequences &)
cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh

# import the colors
. "${HOME}/.cache/wal/colors.sh"

# custom commands
bindkey -v
bindkey '^R' history-incremental-search-backward

# custom aliases
alias llcd='cd $(ls -dtr */ | tail -1)'
alias wscan='sudo iw "wlp3s0" scan | grep "SSID:"'

function mk {
	command mkdir $1 && cd $1
}

precmd() { print "" }
