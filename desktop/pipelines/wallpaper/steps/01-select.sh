#!/usr/bin/env bash

WALL_DIR="$HOME/Images/w"

mapfile -t WALLS < <(
find "$WALL_DIR" -type f \
\( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \)
)

[[ ${#WALLS[@]} -gt 0 ]] || {
    echo "No wallpapers found."
    exit 1
}

LAST="$(pipeline::get wallpaper)"

while :; do

    WALL="${WALLS[RANDOM % ${#WALLS[@]}]}"

    [[ "$WALL" != "$LAST" || ${#WALLS[@]} -eq 1 ]] && break

done

pipeline::set wallpaper "$WALL"