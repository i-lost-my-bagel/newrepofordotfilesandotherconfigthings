#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

sketchybar --set "$NAME" label="$(echo "$(brightness -l | awk 'NR==2 {print $4}') * 100" | bc -l | awk '{printf "%.f\n", int($1+0.5)}')%"

