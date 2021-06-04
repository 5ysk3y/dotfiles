#!/bin/bash

## Check for playing sound:

~/.config/sway/idle/check_sound.sh || exit 1

swaymsg "output * dpms off"
sleep 1
