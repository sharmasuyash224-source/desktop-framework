#!/usr/bin/env bash

pipeline::run() {

    local pipeline="$1"

    pipeline::context_init

    export PIPELINE_NAME="$pipeline"
    export PIPELINE_ROOT="$HOME/.config/desktop/pipelines/$pipeline"

    local steps="$PIPELINE_ROOT/steps"

    [[ -d "$steps" ]] || {
        log::error "Pipeline '$pipeline' not found."
        return 1
    }

    log::step "Pipeline: $PIPELINE_NAME"

    for step in "$steps"/*.sh; do

        [[ -f "$step" ]] || continue

        export PIPELINE_STEP="$(basename "$step")"

        log::info "Running $PIPELINE_STEP"

        source "$step"

    done

    log::success "Pipeline '$PIPELINE_NAME' completed."
}