#!/bin/bash
cliphist list | rofi -config ~/.config/rofi/clipboard.rasi -dmenu -i -window-title 󰅍 | cliphist decode | wl-copy
exit 0
