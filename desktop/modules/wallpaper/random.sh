#!/usr/bin/env bash

WALL_DIR="$HOME/Images/w"

mapfile -t WALLS < <(
find "$WALL_DIR" \
-type f \
\( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \)
)

[[ ${#WALLS[@]} -eq 0 ]] && exit 1

LAST="$HOME/.cache/hypr/last_wallpaper"

PREVIOUS=""

[[ -f "$LAST" ]] && PREVIOUS=$(cat "$LAST")

while :
do
    WALL="${WALLS[RANDOM % ${#WALLS[@]}]}"

    [[ "$WALL" != "$PREVIOUS" || ${#WALLS[@]} -eq 1 ]] && break
done

echo "$WALL"
