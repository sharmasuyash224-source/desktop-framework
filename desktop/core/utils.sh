#!/usr/bin/env bash

desktop::command_exists() {
    command -v "$1" >/dev/null 2>&1
}

desktop::process_running() {
    pgrep -x "$1" >/dev/null 2>&1
}

desktop::require_command() {

    local cmd="$1"

    if ! desktop::command_exists "$cmd"; then
        log::error "Missing command: $cmd"
        exit 1
    fi
}

desktop::require_file() {

    local file="$1"

    if [[ ! -f "$file" ]]; then
        log::error "Missing file: $file"
        exit 1
    fi
}

desktop::require_directory() {

    local dir="$1"

    if [[ ! -d "$dir" ]]; then
        log::error "Missing directory: $dir"
        exit 1
    fi
}
