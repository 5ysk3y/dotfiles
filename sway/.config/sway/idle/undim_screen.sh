#!/bin/bash

## Check for playing sound:

BORKED=$(ddcutil detect | grep -i busy | grep -Eo 'i2c-[0-9]' | sort | uniq)

if [[ $BORKED -eq 0  ]]
then
  for i in $(ddcutil detect | grep -E '/dev/i2c-[0-9]' | awk {'print $3'} | sed 's/\/dev\/i2c-//g')
  do
    ddcutil setvcp 0x10 75 -b $i &
  done
elif [[ $BORKED -gt 1 ]]
then
  notify-send "Monitor Issue" "More than one borked monitor detected"
else
  for i in $(ddcutil detect | grep -E '/dev/i2c-[0-9]' | awk {'print $3'} | grep -vi "^$BORKED\|addr" | sed 's/\/dev\/i2c-//g')
  do
    ddcutil setvcp 0x10 75 -b $i &
  done
  brightnessctl set 75% > /dev/null 2>&1
fi

