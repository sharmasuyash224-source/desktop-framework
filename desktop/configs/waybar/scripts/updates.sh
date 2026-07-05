#!/usr/bin/env bash

source "$HOME/.config/waybar/scripts/lib.sh"

count=$(checkupdates 2>/dev/null | wc -l)

if (( count == 0 )); then
    json "" "" "hidden"
    exit 0
fi

tooltip=$(checkupdates 2>/dev/null)

json "󰮯 $count" "$tooltip" "updates"
