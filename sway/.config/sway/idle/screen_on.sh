#!/bin/bash

swaymsg "output * dpms on"
sleep 2
for i in $(ddcutil detect | grep -i i2c | awk {'print $3'} | awk -F'-' {'print $2'})
  do ddcutil setvcp 0x10 75 -b $i &
done
