#!/bin/bash

swaymsg "output * dpms on" && ~/.config/sway/idle/screen_on.sh
xdotool click 1
sleep 1
