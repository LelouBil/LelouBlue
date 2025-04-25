#!/bin/sh
export XDG_RUNTIME_DIR=/tmp
exec Hyprland --verify-config --i-am-really-stupid --config "/usr/share/desktop-config/hyprland/hyprland.conf"
exit 1
