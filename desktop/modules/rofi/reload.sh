#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

pkill rofi 2>/dev/null || true

log::success "Rofi closed."
