#!/bin/bash

## Check for playing sound:

~/.config/sway/idle/check_sound.sh || exit 1

swaylock -e -f -i DP-2:~/Downloads/Wallpapers/Lock/wp1810653-mr-robot-wallpapers.jpg -s fit -F --font Terminus -c 000000 --text-color FFFFFF
