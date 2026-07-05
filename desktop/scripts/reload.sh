#!/usr/bin/env bash

set -euo pipefail

# Reload Waybar
killall -SIGUSR2 waybar 2>/dev/null || true

# Reload SwayNC (only if running)
if pgrep -x swaync >/dev/null; then
    swaync-client --reload-css >/dev/null 2>&1 || true
fi

# Future:
# hyprlock theme reload (if supported)
# rofi doesn't need a reload because it reads the theme when launched
