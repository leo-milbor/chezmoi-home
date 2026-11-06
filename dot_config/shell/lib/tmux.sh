#!/usr/bin/env bash

function __tmux_create_window {
    local session_name="$1"
    local window_name="$2"
    local command="$3"

    tmux new-window -t "$session_name" -n "$window_name"
    while ! tmux list-windows -t "$session_name" -F '#W' | grep -qx "$window_name"; do
        sleep 0.05
    done
    tmux send-keys -t "$session_name:$window_name" "$command" C-m
}

function __tmux_attach {
    local session_name="$1"
    if [ -n "$TMUX" ]; then
        tmux switch-client -t "$session_name"
    else
        tmux attach-session -t "$session_name"
    fi
}

function __tmux_try_switch {
    local session_name="$1"
    tmux has-session -t "$session_name" 2>/dev/null || return 1
    __log_info "Session $(__style_highlight "$session_name") already exists, switching"
    __tmux_attach "$session_name"
}

function __tmux_switch {
    local session_name="$1"
    local detached="$2"
    if [ "$detached" = true ]; then
        __log_info "Session $(__style_highlight "$session_name") running detached"
        __log_info "Attach with: tmux attach -t $session_name"
        return 0
    fi
    __log_info "Switching to session $(__style_highlight "$session_name")"
    __tmux_attach "$session_name"
}
