#!/usr/bin/env bash

set -e

echo "Updating system..."

sudo pacman -Syu

echo
echo "Updating desktop repository..."

cd ~/.config/desktop

git pull --ff-only

echo
echo "Done."
