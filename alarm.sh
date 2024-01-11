#!/bin/bash

# Check if the user provided the alarm time as a command-line argument
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <alarm_time>"
  exit 1
fi

alarm_time="$1"

while true; do
  current_time=$(date +"%H:%M")
  
  # Check if the current time matches the alarm time
  if [ "$current_time" == "$alarm_time" ]; then
    espeak "Yo yo yo, wake up, you're gonna be late you lazy son of a fucking bitch, yo, wake the fuck up"  # Replace with your desired alarm message
  fi
  
  # Sleep for 1 minute before checking again
  sleep 1
done
