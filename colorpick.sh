#!/bin/bash
output=$(hyprpicker)
echo "$output" | wl-copy
notify-send --app-name="Colorpick" "Color Picked" "$output"
exit 0
