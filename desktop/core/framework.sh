#!/usr/bin/env bash

set -euo pipefail

DESKTOP_ROOT="$HOME/.config/desktop"

source "$DESKTOP_ROOT/manifest.sh"

source "$DESKTOP_ROOT/core/logger.sh"

source "$DESKTOP_ROOT/core/utils.sh"

source "$DESKTOP_ROOT/core/registry.sh"

source "$DESKTOP_ROOT/core/pipeline.sh"

source "$DESKTOP_ROOT/core/context.sh"

source "$DESKTOP_ROOT/core/help.sh"

source "$DESKTOP_ROOT/core/module.sh"
