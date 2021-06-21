#!/bin/bash

# Function to check brightness

function getBrightness {
  ddcutil getvcp 0x10 -b $i | awk -F"current value =" {'print $2'} | awk {'print $1'} | sed 's/,//g'
}

BORKED=$(ddcutil detect | grep -i busy | grep -Eo 'i2c-[0-9]' | sort | uniq)

if [[ $BORKED -eq 0  ]]
then
  for i in $(ddcutil detect | grep -E '/dev/i2c-[0-9]' | awk {'print $3'} | sed 's/\/dev\/i2c-//g')
  do
    ddcutil setvcp 0x10 75 -b $i &

    # Check to see if brightness changed:
    CUR=$(getBrightness)
    # If it isn't 75, then loop until it is:
    while [[ $CUR -ne 75 ]]
    do
        ddcutil setvcp 0x10 75 -b $i &
        sleep 0.5
        CUR=$(getBrightness)
    done
  done

else
  notify-send "Monitor Issue" "More than one borked monitor detected"
fi
