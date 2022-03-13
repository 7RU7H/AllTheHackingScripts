#!/bin/zsh
# For your Debian based os xrandr setup for multiple monitors
# Alias to source outputs 
alias monitorsource='xrandr --setprovideroutputsource 1 0 && xrandr --setprovideroutputsource 2 0 && xrandr --setprovideroutputsource 3 0 && xrandr --setprovideroutputsource 4 0'
# Alias to configure monitor position, size, layout
alias monitorsstd='xrandr --output HDMI-A-0 --primary --mode 1920x1080 --output DVI-I-2-1 --right-of HDMI-A-0 --mode 1920x1080 --output eDP --left-of HDMI-A-0 --mode 1920x1080'
