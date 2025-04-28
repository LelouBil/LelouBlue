#!/bin/sh
set -a
. /usr/lib/environment.d/desktop-env.conf
set +a
export XDG_RUNTIME_DIR=/tmp
exec Hyprland --verify-config --i-am-really-stupid --config "$HYPRLAND_CONFIG_DIR/hyprland.conf"
exit 1
