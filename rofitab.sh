#!/usr/bin/env bash

# Get the list of tabs
tab_list=$(brotab list | grep -v "chrome://vivaldi-webui")

# Extract only the tab names
tab_names=$(echo "$tab_list" | cut -f2)

# Use rofi to select a tab
selected_tab_name=$(echo "$tab_names" | rofi -dmenu -config ~/.config/rofi/app.rasi -window-title "󰓩 ")

# Get the corresponding ID of the selected tab
selected_tab_id=$(echo "$tab_list" | grep "$selected_tab_name" | cut -f1)

# Output the selected tab ID
brotab activate "$selected_tab_id"

exit 0
