#!/bin/bash
output=$(colorpicker --one-shot --preview --short)
echo "$output" | xclip -sel clip
notify-send --app-name="Colorpick" "Color Picked" "$output"
exit 0
