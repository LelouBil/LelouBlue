#!/bin/bash
set -euxo pipefail
set -a
. /usr/lib/environment.d/desktop-env.conf
set +a

# List of systemd user units to configure
UNITS=(
    "hyprpolkitagent.service"
    "hypridle.service"
    "hyprsunset.service"
    "dunst.service"
    "waybar.service"
)

for unit in "${UNITS[@]}"; do
    unit_dir="/usr/lib/systemd/user/${unit}.d"
    mkdir -p "$unit_dir"
    ln -sf "$DESKTOP_CONFIG_DIR/systemd-only-on-hyprland.conf" "$unit_dir/only-on-hyprland.conf"
done

