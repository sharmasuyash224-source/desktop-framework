#!/usr/bin/env bash

if ! pgrep -x swaync >/dev/null; then
    swaync >/dev/null 2>&1 &
fi
