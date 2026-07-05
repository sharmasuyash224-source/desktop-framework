#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

log::info "Reloading Waybar..."

if desktop::process_running waybar; then

    killall -SIGUSR2 waybar

    log::success "Waybar reloaded."

else

    log::warn "Waybar is not running."

fi
