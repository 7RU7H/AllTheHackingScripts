#!/bin/bash

tmux new -s Battleground 
tmux new-window -t SERVER
tmux new-window -t HOME
tmux new-window -t BLUE
tmux new-window -t MSF
tmux new-window -t ATK

tmxu send-keys -t HOME 'cp bg/ /tmp; cd tmp/bg' #setup 
tmux send-keys -t HOME './startBGs.sh'
