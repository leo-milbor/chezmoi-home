#!/usr/bin/env bash

__COLOR_CYAN=6
__COLOR_GREEN=82
__COLOR_PINK=212

function __style_title {
    gum style --foreground "$__COLOR_PINK" --bold "$1"
}

function __style_success {
    gum style --foreground "$__COLOR_GREEN" --bold "$1"
}

function __style_highlight {
    gum style --foreground "$__COLOR_CYAN" "$1"
}
