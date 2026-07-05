#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

desktop::module_load hyprlock

log::info "Locking session..."

exec hyprlock -c "$MODULE_CONFIG_DIR/hyprlock.conf"
