#!/bin/bash

## Check for playing sound:

~/.config/sway/idle/check_sound.sh || exit 1

systemctl hibernate
