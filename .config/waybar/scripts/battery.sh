#!/bin/bash
PERCENTAGE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')
STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2}')

if [ "$STATE" = "charging" ]; then
    echo "⚡ $PERCENTAGE"
elif [ "$STATE" = "plugged" ]; then
    echo "🔌 $PERCENTAGE"
else
    echo "🔋 $PERCENTAGE"
fi
