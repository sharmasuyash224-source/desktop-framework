#!/usr/bin/env bash

set -euo pipefail

WALL_DIR="$HOME/Images/w"
STATE_DIR="$HOME/.cache/hypr"
LAST_WALL="$STATE_DIR/last_wallpaper"
CONF="$HOME/.config/hypr/hyprpaper.conf"

mkdir -p "$STATE_DIR"

mapfile -t WALLPAPERS < <(
    find "$WALL_DIR" -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \)
)

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "No wallpapers found."
    exit 1
fi

PREVIOUS=""
[[ -f "$LAST_WALL" ]] && PREVIOUS=$(cat "$LAST_WALL")

while :; do
    WALL="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"
    [[ "$WALL" != "$PREVIOUS" || ${#WALLPAPERS[@]} -eq 1 ]] && break
done

echo "$WALL" > "$LAST_WALL"

cat > "$CONF" <<EOF
ipc = true

wallpaper {
    monitor = eDP-1
    path = $WALL
    fit_mode = cover
}
EOF

# Reload the running Hyprpaper instance
hyprctl hyprpaper wallpaper "eDP-1,$WALL"

# Update the config so the same wallpaper is restored on the next login
cat > "$CONF" <<EOF
ipc = true

wallpaper {
    monitor = eDP-1
    path = $WALL
    fit_mode = cover
}
EOF

# Generate colors
wallust run "$WALL"

# Reload Waybar
killall -SIGUSR2 waybar 2>/dev/null || {
    killall waybar
    waybar &
}

# Generate colors
wallust run "$WALL"

# Reload Waybar so it picks up the new colors
killall -SIGUSR2 waybar 2>/dev/null || {
    killall waybar
    waybar &
}
