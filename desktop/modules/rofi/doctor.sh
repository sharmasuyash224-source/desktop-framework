#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

desktop::module_load rofi

desktop::require_directory "$MODULE_CONFIG_DIR"

desktop::require_file "$MODULE_CONFIG_DIR/config.rasi"

desktop::require_file "$MODULE_CONFIG_DIR/theme.rasi"

if command -v rofi >/dev/null; then
    log::success "Rofi installed"
else
    log::error "Rofi not installed"
fi
