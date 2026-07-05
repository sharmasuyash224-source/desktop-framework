#!/usr/bin/env bash

time=$(date +"%I:%M %p")
date_short=$(date +"%a %d %b")

tooltip=$(date +"%A, %d %B %Y")

printf '{"text":"%s • %s","tooltip":"%s"}\n' \
    "$time" \
    "$date_short" \
    "$tooltip"