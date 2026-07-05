#!/usr/bin/env bash

set -euo pipefail

source "$HOME/.config/desktop/core/framework.sh"
source "$HOME/.config/desktop/core/pipeline.sh"

WALL="$(pipeline::get wallpaper)"

CONF="$HOME/.config/hypr/hyprpaper.conf"

cat > "$CONF" <<EOF
ipc = true

wallpaper {
    monitor = eDP-1
    path = $WALL
    fit_mode = cover
}
EOF

pkill hyprpaper 2>/dev/null || true

hyprpaper -c "$CONF" >/dev/null 2>&1 &

sleep 0.5
