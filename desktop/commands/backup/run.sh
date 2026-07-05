#!/usr/bin/env bash

set -euo pipefail

source "$HOME/.config/desktop/core/framework.sh"

STAMP=$(date +%Y%m%d-%H%M%S)

BACKUP_DIR="$HOME/DesktopBackups"
BACKUP_FILE="$BACKUP_DIR/desktop-$STAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

log::step "Creating Desktop Framework backup..."

tar -czf "$BACKUP_FILE" \
    "$CONFIG_DIR" \
    "$WAYBAR_DIR" \
    "$HYPRLOCK_DIR" \
    "$ROFI_DIR" \
    "$SWAYNC_DIR" \
    "$POWERMENU_DIR"

log::success "Backup created successfully."

echo
echo "Archive:"
echo "  $BACKUP_FILE"