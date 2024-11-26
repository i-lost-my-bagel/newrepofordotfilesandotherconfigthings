#!/bin/bash

rm /tmp/lock.png
grim - | magick convert -blur 0x10 - /tmp/lock.png
swaylock -i /tmp/lock.png
