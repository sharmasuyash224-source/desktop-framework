#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

desktop::module_load waybar

echo

echo "Waybar Doctor"

echo

desktop::require_directory "$MODULE_CONFIG_DIR"

desktop::require_file "$MODULE_CONFIG_DIR/config.jsonc"

desktop::require_file "$MODULE_CONFIG_DIR/style.css"

desktop::process_running waybar \
    && log::success "Waybar running" \
    || log::warn "Waybar stopped"

echo
