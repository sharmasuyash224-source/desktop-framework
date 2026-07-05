#!/usr/bin/env bash

set -euo pipefail

ROOT="$HOME/.config/desktop"

if [[ $# -eq 0 ]]; then
    "$ROOT/core/help.sh"
    exit 0
fi

COMMAND="$1"
shift || true

MANIFEST="$ROOT/commands/$COMMAND/manifest.sh"
RUNNER="$ROOT/commands/$COMMAND/run.sh"

if [[ ! -f "$MANIFEST" ]]; then
    echo "Unknown command: $COMMAND"
    echo
    "$ROOT/core/help.sh"
    exit 1
fi

source "$MANIFEST"

if [[ ! -x "$RUNNER" ]]; then
    echo "Command '$COMMAND' is not executable."
    exit 1
fi

exec "$RUNNER" "$@"
