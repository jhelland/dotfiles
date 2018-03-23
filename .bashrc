#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

(cat ~/.cache/wal/sequences &)
cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh

# import the colors
. "${HOME}/.cache/wal/colors.sh"

# create alias
# alias dmen='dmenu_run -nb "$color0" -nf "$color15" 0sb "$color1" -sf "$color15"'

# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

