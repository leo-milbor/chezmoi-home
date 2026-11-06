#!/usr/bin/env bash

__COLOR_CYAN=6
__COLOR_GREEN=82
__COLOR_PINK=212

function __style {
    local text="$1"
    shift
    if __has_command gum; then
        gum style "$@" "$text"
    else
        printf '%s\n' "$text"
    fi
}

function __style_title {
    __style "$1" --foreground "$__COLOR_PINK" --bold
}

function __style_success {
    __style "$1" --foreground "$__COLOR_GREEN" --bold
}

function __style_highlight {
    __style "$1" --foreground "$__COLOR_CYAN"
}
