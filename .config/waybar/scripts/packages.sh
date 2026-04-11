#!/bin/bash
updates=$(checkupdates 2>/dev/null | wc -l)
aur_updates=$(paru -Qua 2>/dev/null | wc -l)
total=$((updates + aur_updates))
echo "{\"text\": \"$total \", \"tooltip\": \"$updates system, $aur_updates AUR\"}"