#!/bin/bash
cliphist list | rofi -config $XDG_CONFIG_HOME/rofi/clipboard.rasi -dmenu -window-title 󰅍 | cliphist decode | wl-copy
