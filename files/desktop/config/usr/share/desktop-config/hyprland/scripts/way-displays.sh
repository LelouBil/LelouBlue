#!/bin/sh

sleep 1 # give Hyprland a moment to set its defaults

way-displays --config "$WAY_DISPLAYS_CONFIG_FILE" > "/tmp/way-displays.${XDG_VTNR}.${USER}.log" 2>&1
