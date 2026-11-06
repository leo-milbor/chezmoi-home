#!/usr/bin/env bash

function __has_command {
    command -v "$1" >/dev/null 2>&1
}

function __ensure_installed {
    local tool="$1"
    if ! __has_command "$tool"; then
        __log_error "$tool is not installed"
        return 1
    fi
}
