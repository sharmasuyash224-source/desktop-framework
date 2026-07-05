#!/usr/bin/env bash

declare -gA PIPELINE_CONTEXT

pipeline::context_init() {

    PIPELINE_CONTEXT=()
}

pipeline::set() {

    local key="$1"

    shift

    PIPELINE_CONTEXT["$key"]="$*"
}

pipeline::get() {

    local key="$1"

    printf "%s" "${PIPELINE_CONTEXT[$key]:-}"
}