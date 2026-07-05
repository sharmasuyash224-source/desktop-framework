#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

echo
echo "========================================"
echo "      Desktop Framework Doctor"
echo "========================================"
echo

check_service() {

    local name="$1"

    if desktop::process_running "$name"; then
        log::success "$name"
    else
        log::error "$name"
    fi
}

check_file() {

    local file="$1"

    local label="$2"

    if [[ -f "$file" ]]; then
        log::success "$label"
    else
        log::error "$label"
    fi
}

check_directory() {

    local dir="$1"

    local label="$2"

    if [[ -d "$dir" ]]; then
        log::success "$label"
    else
        log::error "$label"
    fi
}

echo "Desktop Services"
echo "----------------"

check_service hyprpaper
check_service waybar
check_service swaync
check_service hypridle
check_service playerctld

echo
echo "Theme Engine"
echo "------------"

check_directory "$THEME_ENGINE_DIR" "Theme Engine"

check_file "$WALLUST_COLORS" "Wallust Cache"

echo
echo "Desktop Modules"
echo "---------------"

for module in $(desktop::list_modules); do

    path=$(desktop::module_path "$module")

    if [[ -d "$path" ]]; then
        log::success "$module"
    else
        log::error "$module"
    fi

done

echo
echo "Framework"

log::success "$DESKTOP_NAME"

echo
