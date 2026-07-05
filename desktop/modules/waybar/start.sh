#!/usr/bin/env bash

if pgrep -x waybar >/dev/null; then
    exit 0
fi

waybar >/dev/null 2>&1 &
