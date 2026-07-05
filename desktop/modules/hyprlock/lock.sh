#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

log::info "Locking session..."

exec hyprlock --config "$HOME/.config/hyprlock/hyprlock.conf"
