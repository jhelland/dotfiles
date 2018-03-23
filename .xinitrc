#!/bin/sh

#xrdb ~/.Xresources

xbindkeys &
xrdb -merge ~/.Xresources &
#feh --bg-scale ~/Pictures/botw.jpg &
#wal -R
wal -i "$HOME/Pictures/" -o wal-set
#wal-steam -W
numlockx &
#bash /home/jhelland/Scripts/wifi.sh connect &
bash ~/Scripts/hdmi.sh &
# redshift &

exec i3
