local function exec(command)
  return hl.dsp.exec_cmd(command)
end

---@class HyprlandSystemBindsModule
---@field setup fun(programs: HyprlandPrograms)
---@type HyprlandSystemBindsModule
return {
  setup = function (programs)
    hl.bind("XF86PowerOff", exec('eww --config "$EWW_CONFIG_DIR" open --toggle powermenu'), { locked = true })

    hl.bind("XF86AudioMute", exec("amixer set Master toggle && $HYPRLAND_CONFIG_DIR/scripts/volume.sh up 0"))
    hl.bind("XF86AudioRaiseVolume", exec("$HYPRLAND_CONFIG_DIR/scripts/volume.sh up 10"), { repeating = true })
    hl.bind("XF86AudioLowerVolume", exec("$HYPRLAND_CONFIG_DIR/scripts/volume.sh down 10"), { repeating = true })

    hl.bind("XF86MonBrightnessUp", exec("$HYPRLAND_CONFIG_DIR/scripts/brightness.sh up 5"), { repeating = true })
    hl.bind("XF86MonBrightnessDown", exec("$HYPRLAND_CONFIG_DIR/scripts/brightness.sh down 5"), { repeating = true })

    hl.bind("XF86AudioPlay", exec("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioNext", exec("playerctl next"), { locked = true })
    hl.bind("XF86AudioPrev", exec("playerctl previous"), { locked = true })

    hl.bind(programs.main_mod .. " + l", exec("loginctl lock-session"))
  end
}
