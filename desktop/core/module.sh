#!/usr/bin/env bash

desktop::module_directory() {

    local module="$1"

    echo "$HOME/.config/desktop/modules/$module"
}

desktop::module_exists() {

    [[ -d "$(desktop::module_directory "$1")" ]]
}

desktop::module_load() {

    local module="$1"

    local dir
    dir="$(desktop::module_directory "$module")"

    [[ -d "$dir" ]] || {
        log::error "Module '$module' not found."
        return 1
    }

    [[ -f "$dir/manifest.sh" ]] || {
        log::warn "Module '$module' is incomplete."
        return 1
    }

    source "$dir/manifest.sh"
}

desktop::list_modules() {

    local dir="$HOME/.config/desktop/modules"

    for module in "$dir"/*; do

        [[ -d "$module" ]] || continue

        [[ -f "$module/manifest.sh" ]] || continue

        basename "$module"

    done | sort
}

desktop::module_run() {

    local module="$1"
    local action="$2"

    desktop::module_load "$module"

    local script
    script="$(desktop::module_directory "$module")/$action.sh"

    [[ -x "$script" ]] || {
        log::error "Module '$module' does not support '$action'."
        return 1
    }

    exec "$script"
}

desktop::module_reload() {
    desktop::module_run "$1" reload
}

desktop::module_status() {
    desktop::module_run "$1" status
}

desktop::module_doctor() {
    desktop::module_run "$1" doctor
}

desktop::module_theme() {
    desktop::module_run "$1" theme
}

desktop::module_run_hooks() {

    local module="$1"
    local hook="$2"

    local dir
    dir="$(desktop::module_directory "$module")/hooks/$hook"

    [[ -d "$dir" ]] || return 0

    for script in "$dir"/*.sh; do

        [[ -x "$script" ]] || continue

        log::info "Hook: $(basename "$script")"

        "$script"

    done
}

desktop::module_reload_all() {

    local module

    for module in $(desktop::list_modules); do

        desktop::module_load "$module" || continue

        [[ "${MODULE_RELOADABLE:-false}" == true ]] || continue

        desktop::module_reload "$module"

    done
}

desktop::module_start() {

    local module="$1"

    local dir
    dir="$(desktop::module_directory "$module")"

    [[ -x "$dir/start.sh" ]] || return 0

    "$dir/start.sh"
}

desktop::module_stop() {

    local module="$1"

    local dir
    dir="$(desktop::module_directory "$module")"

    [[ -x "$dir/stop.sh" ]] || return 0

    "$dir/stop.sh"
}

desktop::module_restart() {

    local module="$1"

    desktop::module_stop "$module"

    sleep 0.2

    desktop::module_start "$module"
}
