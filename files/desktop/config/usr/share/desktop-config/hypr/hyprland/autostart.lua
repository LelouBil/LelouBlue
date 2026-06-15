local function exec_uwsm(cmd, opts)
  return hl.exec_cmd("uwsm app -- " .. cmd, opts)
end

---@class HyprlandAutostartModule
---@field setup fun()
---@type HyprlandAutostartModule
return {
  setup = function()
    hl.on("hyprland.start", function()
      hl.exec_cmd("hyprlock --immediate --immediate-render")
      exec_uwsm("kitty -1 --detach --minimized")

      exec_uwsm("awww-daemon -f xrgb")
      hl.exec_cmd('awww img -o "eDP-1" -t none $HYPRLAND_CONFIG_DIR/wallpaper.png')
      hl.exec_cmd('awww img -o "DP-2" -t none $HYPRLAND_CONFIG_DIR/wallpaper-2.png')

      exec_uwsm('eww --config "$EWW_CONFIG_DIR" daemon')
      hl.exec_cmd("amixer set Master mute")
      hl.exec_cmd("amixer set Master 0%")

      exec_uwsm('playerctl -F status | xargs -i bash -c "$EWW_CONFIG_DIR/media-notification.sh &"')

      exec_uwsm("wl-clip-persist --clipboard both --all-mime-type-regex '^(?!x-kde-passwordManagerHint).+'")
      exec_uwsm("copyq --start-server")

      exec_uwsm("$HYPRLAND_CONFIG_DIR/scripts/headphones-unplug.sh")

      hl.exec_cmd("sleep 1; uwsm app -- flatpak run dev.vencord.Vesktop", {
        workspace = "4",
        silent = true
      })
    end)
  end
}
