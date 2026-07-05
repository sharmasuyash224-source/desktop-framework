#!/usr/bin/env bash

# ==========================================================
# Desktop Framework Manifest
# Version: 1.0
# ==========================================================

# ----------------------------------------------------------
# Desktop Information
# ----------------------------------------------------------

DESKTOP_NAME="Desktop v3"
DESKTOP_VERSION="1.0"

AUTHOR="Suyash"

# ----------------------------------------------------------
# Paths
# ----------------------------------------------------------

CONFIG_DIR="$HOME/.config/desktop"

THEME_ENGINE_DIR="$HOME/.config/theme-engine"

WAYBAR_DIR="$CONFIG_DIR/configs/waybar"
HYPRLOCK_DIR="$CONFIG_DIR/configs/hyprlock"
ROFI_DIR="$CONFIG_DIR/configs/rofi"
SWAYNC_DIR="$CONFIG_DIR/configs/swaync"
POWERMENU_DIR="$CONFIG_DIR/configs/powermenu"

# ----------------------------------------------------------
# Wallpaper
# ----------------------------------------------------------

WALLPAPER_DIR="$HOME/Images/w"

MONITOR="eDP-1"

WALLPAPER_INTERVAL=900

# ----------------------------------------------------------
# Wallust
# ----------------------------------------------------------

WALLUST_COLORS="$HOME/.cache/wallust/colors-waybar.css"

# ----------------------------------------------------------
# Fonts
# ----------------------------------------------------------

FONT_MAIN="JetBrainsMono Nerd Font"

FONT_DEVANAGARI="Noto Sans Devanagari"

FONT_SIZE=13

# ----------------------------------------------------------
# Desktop Theme
# ----------------------------------------------------------

THEME_NAME="Wallust"

THEME_MODE="dynamic"

ACCENT_STYLE="wallust"

# ----------------------------------------------------------
# Desktop Modules
# ----------------------------------------------------------

MODULES=(
    waybar
    hyprlock
    rofi
    swaync
    powermenu
)

# ----------------------------------------------------------
# Theme Generators
# ----------------------------------------------------------

GENERATORS=(
    hyprlock
    rofi
    swaync
    powermenu
)

# ----------------------------------------------------------
# Services
# ----------------------------------------------------------

SERVICES=(
    hyprpaper
    wallust
    waybar
    swaync
    hypridle
    playerctld
    nm-applet
)

# ----------------------------------------------------------
# Reloadable Components
# ----------------------------------------------------------

RELOADABLE=(
    waybar
    swaync
)

# ----------------------------------------------------------
# Feature Flags
# ----------------------------------------------------------

ENABLE_DYNAMIC_THEME=true

ENABLE_MEDIA_MODULE=true

ENABLE_POWER_MENU=true

ENABLE_NOTIFICATIONS=true

ENABLE_LAUNCHER=true

ENABLE_WALLPAPER_TIMER=true
