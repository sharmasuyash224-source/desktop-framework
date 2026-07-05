#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

if pgrep -x swaync >/dev/null; then

    pkill -USR2 swaync 2>/dev/null || true

    log::success "SwayNC reloaded."

else

    log::warn "SwayNC is not running."

fi
