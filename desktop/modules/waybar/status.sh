#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

if desktop::process_running waybar
then
    echo "running"
else
    echo "stopped"
fi
