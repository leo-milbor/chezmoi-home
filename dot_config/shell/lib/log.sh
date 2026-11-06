#!/usr/bin/env bash

function __log {
    local level="$1"
    local message="$2"
    if __has_command gum; then
        gum log -l "$level" "$message"
    else
        printf '%s %s\n' "$(printf '%s' "$level" | tr '[:lower:]' '[:upper:]')" "$message" >&2
    fi
}

function __log_info {
    __log info "$1"
}

function __log_warn {
    __log warn "$1"
}

function __log_error {
    __log error "$1"
}
