#!/bin/bash

## Check for playing sound:

~/.config/sway/idle/check_sound.sh || exit 1

BORKED=$(ddcutil detect | grep -i busy | grep -Eo 'i2c-[0-9]' | sort | uniq)

if [[ $BORKED -eq 0 ]]
then
  for i in $(ddcutil detect | grep -E '/dev/i2c-[0-9]' | awk {'print $3'} | sed 's/\/dev\/i2c-//g')
  do
    ddcutil setvcp 0x10 05 -b $i &
  done
elif [[ $BORKED -gt 1 ]]
then
  notify-send "Monitor Issue" "More than one borked monitor detected"
else
  for i in $(ddcutil detect | grep -E '/dev/i2c-[0-9]' | awk {'print $3'} | grep -vi "^$BORKED\|addr" | sed 's/\/dev\/i2c-//g')
  do
    ddcutil setvcp 0x10 05 -b $i &
  done
  brightnessctl set 20% > /dev/null 2>&1
fi
