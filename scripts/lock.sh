#!/usr/bin/env bash

#icon="$HOME/Pictures/bluescreen/412608.jpg"
#tmpbg="$HOME/Pictures/bluescreen/bluescreen.png"

#(( $# )) && { icon=$1; }
#
#maim "$tmpbg"
#convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#mpc pause
#
#add icon (not the greatest with multiple monitors
#potentially use i3lock-fancy-mutiple-monitors instead
#if [ "$HOSTNAME" = trsh ]; then
#    convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
#    i3lock -u -i "$tmpbg"
#else
#    i3lock -i "$tmpbg" -n
#fi
#

#i3lock -i "$tmpbg" -n

#!/usr/bin/env bash

# Enable compton's fade-in effect so that the lockscreen gets a nice fade-in
# effect.
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:false

# If disable unredir_if_possible is enabled in compton's config, we may need to
# disable that to avoid flickering. YMMV. To try that, uncomment the following
# two lines and the last two lines in this script.
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u $USER -USR1 dunst
i3lock -n -i $HOME/Pictures/bluescreen/bluescreen.png \
    --insidecolor=373445ff --ringcolor=ffffffff --line-uses-inside \
    --keyhlcolor=1a67c4ff --bshlcolor=d23c3dff --separatorcolor=00000000 \
    --insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
    --ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+86:y+1003" \
    --radius=35 --veriftext="" --wrongtext=""
pkill -u $USER -USR2 dunst

# Revert compton's config changes.
sleep 0.2
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:true
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:unredir_if_possible boolean:true
