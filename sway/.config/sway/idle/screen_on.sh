#!/bin/bash

swaymsg "output * dpms on"
sleep 1
bash ~/.config/sway/idle/undim_screen.sh
