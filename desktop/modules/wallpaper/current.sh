#!/usr/bin/env bash

STATE="$HOME/.cache/hypr/last_wallpaper"

if [[ -f "$STATE" ]]; then
    cat "$STATE"
fi
