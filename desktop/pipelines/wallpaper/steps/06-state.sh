#!/usr/bin/env bash

set -euo pipefail

STATE="$HOME/.cache/hypr"

mkdir -p "$STATE"

echo "$(pipeline::get wallpaper)" \
> "$STATE/last_wallpaper"