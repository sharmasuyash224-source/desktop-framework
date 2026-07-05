#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

desktop::require_directory "$HOME/Images/w"
desktop::require_directory "$HOME/.config/desktop/pipelines/wallpaper"

command -v wallust >/dev/null || log::error "wallust not installed"
command -v hyprpaper >/dev/null || log::error "hyprpaper not installed"

log::success "Wallpaper module healthy"