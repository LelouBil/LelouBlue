#!/bin/sh
set -euxo pipefail
set -a
. /usr/lib/environment.d/desktop-env.conf
set +a
export XDG_RUNTIME_DIR=/tmp
>&2 exec Hyprland --verify-config --i-am-really-stupid
echo "Failed to exec Hyprland"
exit 1
