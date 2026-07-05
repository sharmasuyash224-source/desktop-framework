#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

desktop::require_directory "$MODULE_CONFIG_DIR"
desktop::require_file "$MODULE_CONFIG_DIR/config.json"
desktop::require_file "$MODULE_CONFIG_DIR/style.css"

if pgrep -x swaync >/dev/null; then
    log::success "SwayNC running"
else
    log::warn "SwayNC stopped"
fi
