#!/bin/sh 
tmux new-session -d 'vim'
tmux split-window -v 'node'
tmux split-window -h
tmux new-window 'mutt'
tmux -2 attach-session -d 
