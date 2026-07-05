#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

if desktop::process_running hyprlock
then
    echo "locked"
else
    echo "idle"
fi
