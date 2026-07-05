#!/usr/bin/env bash

if pgrep -x hypridle >/dev/null; then
    echo "running"
else
    echo "stopped"
fi
