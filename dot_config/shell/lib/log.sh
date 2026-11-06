#!/usr/bin/env bash

function __log_info {
    gum log -l info "$1"
}

function __log_warn {
    gum log -l warn "$1"
}

function __log_error {
    gum log -l error "$1"
}
