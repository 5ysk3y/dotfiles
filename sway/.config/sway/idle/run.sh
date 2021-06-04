#!/bin/bash

DIM_TIMEOUT=300 # 5 mins = dim
let DPMS_TIMEOUT=$DIM_TIMEOUT+30 # 5 and a half mins = screen off
let LOCK_TIMEOUT=$DPMS_TIMEOUT+270 # 10 mins = screen lock
let SUSPEND_TIMEOUT=$LOCK_TIMEOUT+600 # 20 mins = suspend

DIR=~/.config/sway/idle

pkill swayidle

swayidle \
  timeout $DIM_TIMEOUT "$DIR/dim_screen.sh" \
    resume "$DIR/undim_screen.sh" \
  timeout $DPMS_TIMEOUT "$DIR/screen_off.sh" \
    resume "$DIR/screen_on.sh" \
  timeout $LOCK_TIMEOUT "$DIR/lock.sh" \
    resume "$DIR/screen_on.sh" \
  timeout $SUSPEND_TIMEOUT "$DIR/suspend.sh" \
  after-resume "$DIR/post_suspend.sh"
