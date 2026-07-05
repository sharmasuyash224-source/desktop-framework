#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

desktop::module_load hypridle

if pgrep -x hypridle >/dev/null; then
    exit 0
fi

log::info "Starting Hypridle..."

hypridle >/dev/null 2>&1 &
