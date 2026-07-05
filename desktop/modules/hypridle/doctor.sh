#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

log::step "Checking Hypridle..."

if command -v hypridle >/dev/null 2>&1; then
    log::success "Hypridle is installed."
else
    log::error "Hypridle is not installed."
fi

if [[ -f "$HOME/.config/hypr/hypridle.conf" ]]; then
    log::success "Configuration found."
else
    log::error "Configuration missing."
fi

if pgrep -x hypridle >/dev/null; then
    log::success "Hypridle is running."
else
    log::warn "Hypridle is not running."
fi
