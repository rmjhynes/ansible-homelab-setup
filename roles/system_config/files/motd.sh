#!/bin/bash
figlet -f slant Homelab

if [[ -n $(pgrep tmux) ]]; then
    tmux display-message -p 'There are #{server_sessions} tmux sessions running on #{host}:'
    tmux ls
else
    echo "The tmux server is not currently running on $(hostname) - unable to list sessions"
fi
