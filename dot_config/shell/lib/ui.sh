#!/usr/bin/env bash

function __spinner {
    local message="$1"
    shift
    if __has_command gum; then
        gum spin --spinner dot --show-stdout --title "$message" -- "$@"
    else
        printf '%s\n' "$message" >&2
        "$@"
    fi
}
