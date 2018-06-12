#!/bin/bash

# source wal colors so we can align output colors
# with those expected to be used by polybar
source "${HOME}/.cache/wal/colors.sh"
foreground_alt=$color2

if pgrep -x openvpn >&/dev/null; then
    echo %{F$foreground_alt}%{F-} VPN on;
else 
    echo %{F$foreground_alt}%{F-}%{F#f00} VPN off%{F-}; 
fi
