#!/usr/bin/env bash

function __ensure_installed {
    local tool="$1"
    if ! command -v "$tool" >/dev/null 2>&1; then
        __log_error "$tool is not installed"
        return 1
    fi
}
