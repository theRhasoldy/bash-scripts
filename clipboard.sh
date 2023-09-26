#!/bin/bash
cliphist list | rofi -config ~/.config/rofi/clipboard.rasi -dmenu -window-title 󰅍 | cliphist decode | wl-copy
