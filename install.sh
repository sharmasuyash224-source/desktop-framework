#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Desktop Framework v1.0.0"

mkdir -p "$HOME/.config"

if [[ ! -e "$HOME/.config/desktop" ]]; then
ln -s "$ROOT/desktop" "$HOME/.config/desktop"
fi

mkdir -p "$HOME/.local/bin"

ln -sf "$HOME/.config/desktop/scripts/desktop.sh" 
"$HOME/.local/bin/desktop"

chmod +x "$HOME/.config/desktop/scripts/"*.sh

echo
echo "Running validation..."
desktop doctor

echo
echo "Desktop Framework installed successfully."
