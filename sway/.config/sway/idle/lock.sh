#!/bin/bash

## Check for playing sound:

~/.config/sway/idle/check_sound.sh || exit 1

swaylock -e -f -i DP-2:~/Downloads/Wallpapers/Lock/watch-dogs-logo.png -s center -F --font Terminus -c 000000 --text-color FFFFFF --fade-in 0.5 --clock --indicator-thickness 10 --ring-color FFFFFF -e --indicator-radius 270 --font-size 60 --line-color FFFFFF --bs-hl-color FFFFFF
