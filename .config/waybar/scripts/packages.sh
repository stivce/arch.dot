#!/usr/bin/env bash
set -uo pipefail

updates=0
aur_updates=0

updates=$(checkupdates 2>/dev/null | wc -l) || updates=0
aur_updates=$(paru -Qua 2>/dev/null | wc -l) || aur_updates=0

total=$((updates + aur_updates))
printf '{"text": "%d ", "tooltip": "%d system, %d AUR"}\n' "$total" "$updates" "$aur_updates"
