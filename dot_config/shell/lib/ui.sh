#!/usr/bin/env bash

function __spinner {
    local message="$1"
    shift
    gum spin --spinner dot --show-stdout --title "$message" -- "$@"
}
