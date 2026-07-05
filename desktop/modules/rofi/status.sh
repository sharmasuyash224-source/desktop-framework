#!/usr/bin/env bash

if pgrep -x rofi >/dev/null; then
    echo "running"
else
    echo "idle"
fi
