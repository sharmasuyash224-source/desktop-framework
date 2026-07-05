#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Desktop Framework v1.0.0"

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config/hypr"

rm -f "$HOME/.config/desktop"
ln -s "$ROOT/desktop" "$HOME/.config/desktop"

rm -rf "$HOME/.config/waybar"
ln -s "$ROOT/desktop/configs/waybar" "$HOME/.config/waybar"

rm -rf "$HOME/.config/hyprlock"
ln -s "$ROOT/desktop/configs/hyprlock" "$HOME/.config/hyprlock"

rm -rf "$HOME/.config/rofi"
ln -s "$ROOT/desktop/configs/rofi" "$HOME/.config/rofi"

rm -rf "$HOME/.config/powermenu"
ln -s "$ROOT/desktop/configs/powermenu" "$HOME/.config/powermenu"

rm -rf "$HOME/.config/swaync"
ln -s "$ROOT/desktop/configs/swaync" "$HOME/.config/swaync"

rm -f "$HOME/.config/hypr/hypridle.conf"
ln -s \
"$ROOT/desktop/configs/hypridle/hypridle.conf" \
"$HOME/.config/hypr/hypridle.conf"

ln -sf \
"$HOME/.config/desktop/scripts/desktop.sh" \
"$HOME/.local/bin/desktop"

find "$HOME/.config/desktop" -type f -name "*.sh" -exec chmod +x {} \;

echo
echo "Running validation..."

desktop doctor

echo
echo "Desktop Framework installed successfully."
