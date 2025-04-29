#!/bin/bash
set -euxo pipefail

close_file="/tmp/media-notification.time"
cur_time_seconds=$(date +%s)
next_close_time=$((cur_time_seconds + 3))
if [[ -f $close_file ]]; then
  echo "already exists"
  echo $next_close_time > $close_file
  exit
fi
echo $next_close_time > $close_file

eww --config "$EWW_CONFIG_DIR" update time-visible=true
eww --config "$EWW_CONFIG_DIR" open media-notification
should_close=false

while [[ ! $should_close = true ]]; do

sleep 1
cur_time_seconds=$(date +%s)
close_time=$(cat $close_file)
if [[ $cur_time_seconds -gt $close_time ]]; then
  should_close=true
  else
    should_close=false
    fi
done
eww --config "$EWW_CONFIG_DIR" close media-notification
eww --config "$EWW_CONFIG_DIR" update time-visible=false
rm $close_file


