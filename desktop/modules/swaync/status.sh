#!/usr/bin/env bash

if pgrep -x swaync >/dev/null; then
    echo "running"
else
    echo "stopped"
fi
