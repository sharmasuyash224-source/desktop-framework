#!/usr/bin/env bash

declare -A MODULE_REGISTRY

desktop::discover_modules() {

    MODULE_REGISTRY=()

    local modules_dir="$HOME/.config/desktop/modules"

    for module_dir in "$modules_dir"/*; do

        [[ -d "$module_dir" ]] || continue

        [[ -f "$module_dir/manifest.sh" ]] || continue

        unset MODULE_NAME
        unset MODULE_PATH
        unset MODULE_ENABLED

        source "$module_dir/manifest.sh"

        [[ "${MODULE_ENABLED:-true}" != true ]] && continue

        MODULE_REGISTRY["$MODULE_NAME"]="$module_dir"

    done
}

desktop::module_exists() {

    desktop::discover_modules

    [[ -n "${MODULE_REGISTRY[$1]:-}" ]]
}

desktop::module_path() {

    desktop::discover_modules

    echo "${MODULE_REGISTRY[$1]:-}"

}

desktop::list_modules() {

    desktop::discover_modules

    printf "%s\n" "${!MODULE_REGISTRY[@]}" | sort

}
