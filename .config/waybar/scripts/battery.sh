#!/usr/bin/env bash
set -uo pipefail

BATTERY_PATH="/org/freedesktop/UPower/devices/battery_BAT0"
BATTERY_INFO=$(upower -i "$BATTERY_PATH" 2>/dev/null) || { echo "No battery"; exit 0; }

PERCENTAGE=$(awk '/percentage/ {print $2}' <<< "$BATTERY_INFO")
STATE=$(awk '/state/ {print $2}' <<< "$BATTERY_INFO")

case "$STATE" in
    charging)                echo "⚡ $PERCENTAGE" ;;
    plugged-in|fully-charged) echo "🔌 $PERCENTAGE" ;;
    *)                       echo "🔋 $PERCENTAGE" ;;
esac
