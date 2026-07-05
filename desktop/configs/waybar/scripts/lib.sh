#!/usr/bin/env bash

json() {
    local text="$1"
    local tooltip="${2:-}"
    local class="${3:-}"

    jq -cn \
        --arg text "$text" \
        --arg tooltip "$tooltip" \
        --arg class "$class" \
        '{
            text: $text,
            tooltip: $tooltip,
            class: $class
        }'
}
