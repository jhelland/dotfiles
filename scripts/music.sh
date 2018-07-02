#!/bin/bash

exec cp ~/.cache/wal/colors ~/.config/vis/colors/theme &
exec urxvt -e vis &
exec urxvt -e cmus &
