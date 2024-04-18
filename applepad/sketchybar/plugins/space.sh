#!/usr/local/bin/bash

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

#sketchybar --set "$NAME" background.drawing="$SELECTED"

if [ $SELECTED = 'true' ]; then
	sketchybar --set "$NAME" background.color=0xfff48fb1
else
	sketchybar --set "$NAME" background.color=0xffffffff
fi
