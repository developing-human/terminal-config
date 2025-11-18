#!/bin/bash

# 1-10 goes to the external monitor
for workspace in $(seq 10); do
  hyprctl dispatch moveworkspacetomonitor $workspace DP-4
done

# 11 & 12 stay on laptop screen
hyprctl dispatch moveworkspacetomonitor 11 eDP-1
hyprctl dispatch moveworkspacetomonitor 12 eDP-1
