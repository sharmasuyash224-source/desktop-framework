#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

desktop::module_load hyprlock

echo
echo "Hyprlock Doctor"
echo

desktop::require_directory "$MODULE_CONFIG_DIR"

desktop::require_file "$MODULE_CONFIG_DIR/hyprlock.conf"

log::success "Configuration OK"

echo
