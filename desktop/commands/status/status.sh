#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

get_status() {
    if desktop::process_running "$1"; then
        printf "Running"
    else
        printf "Stopped"
    fi
}

CURRENT_WALL=$(cat "$HOME/.cache/hypr/last_wallpaper" 2>/dev/null || echo "Unknown")

echo
echo "========================================"
echo "        Desktop Framework Status"
echo "========================================"
echo

printf "%-20s %s\n" "Framework" "$DESKTOP_VERSION"
printf "%-20s %s\n" "Wallpaper" "$(basename "$CURRENT_WALL")"
printf "%-20s %s\n" "Theme Engine" "Ready"

echo
echo "Services"
echo "--------"

printf "%-20s %s\n" "Hyprpaper" "$(get_status hyprpaper)"
printf "%-20s %s\n" "Waybar" "$(get_status waybar)"
printf "%-20s %s\n" "SwayNC" "$(get_status swaync)"
printf "%-20s %s\n" "Hypridle" "$(get_status hypridle)"
printf "%-20s %s\n" "Playerctld" "$(get_status playerctld)"

echo
echo "Modules"
echo "-------"

for module in $(desktop::list_modules); do
    printf "%-20s Installed\n" "$module"
done

echo
