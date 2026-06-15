local function exec(command)
  return hl.dsp.exec_cmd(command)
end

local function bind(keys, dispatcher, opts)
  hl.bind(keys, dispatcher, opts)
end

---@class HyprlandBindsModule
---@field setup fun(programs: HyprlandPrograms)
---@type HyprlandBindsModule
return {
  ---@param programs HyprlandPrograms
  setup = function(programs)
    local mod = programs.main_mod

    bind(mod .. " + Return", exec(programs.terminal))
    bind(mod .. " + SHIFT + Return", exec("flatpak run org.mozilla.firefox"))
    bind(mod .. " + SHIFT + Q", hl.dsp.window.close())
    bind(mod .. " + E", exec(programs.file_manager))
    bind(mod .. " + V", exec("(hyprctl clients | grep -E 'class: com.github.hluk.copyq') && copyq hide || copyq show"))
    bind(mod .. " + SHIFT + V", function()
      hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
      hl.dispatch(hl.dsp.window.center())
    end)
    bind(mod .. " + D", exec(programs.menu))
    bind(mod .. " + dollar", function()
      hl.exec_cmd("dunstctl action")
      hl.exec_cmd("dunstctl close")
    end)
    bind(mod .. " + SHIFT + dollar", exec("dunstctl close"))
    bind(mod .. " + CTRL + dollar", exec("dunstctl context"))

    bind(mod .. " + SHIFT + J", hl.dsp.window.pseudo())
    bind(mod .. " + J", hl.dsp.layout("togglesplit"))

    bind(mod .. " + SHIFT + M", hl.dsp.layout("swapwithmaster"))
    bind(mod .. " + M", hl.dsp.layout("focusmaster"))
    bind(mod .. " + F", hl.dsp.window.fullscreen(1))

    bind(mod .. " + Up", hl.dsp.exec_raw("movefocus u"), { repeating = true })
    bind(mod .. " + Right", hl.dsp.exec_raw("movefocus r"), { repeating = true })
    bind(mod .. " + Left", hl.dsp.exec_raw("movefocus l"), { repeating = true })
    bind(mod .. " + Down", hl.dsp.exec_raw("movefocus d"), { repeating = true })

    bind(mod .. " + SHIFT + Right", hl.dsp.exec_raw("movewindoworgroup r"), { repeating = true })
    bind(mod .. " + SHIFT + Left", hl.dsp.exec_raw("movewindoworgroup l"), { repeating = true })
    bind(mod .. " + SHIFT + Up", hl.dsp.exec_raw("movewindoworgroup u"), { repeating = true })
    bind(mod .. " + SHIFT + Down", hl.dsp.exec_raw("movewindoworgroup d"), { repeating = true })
    bind(mod .. " + SHIFT + ALT + Up", hl.dsp.exec_raw("resizeactive 0 -50"), { repeating = true })
    bind(mod .. " + SHIFT + ALT + Down", hl.dsp.exec_raw("resizeactive 0 50"), { repeating = true })
    bind(mod .. " + SHIFT + ALT + Right", hl.dsp.exec_raw("resizeactive 50 0"), { repeating = true })
    bind(mod .. " + SHIFT + ALT + Left", hl.dsp.exec_raw("resizeactive -50 0"), { repeating = true })

    bind(mod .. " + SHIFT + P", hl.dsp.group.toggle())
    bind(mod .. " + O", hl.dsp.exec_raw("changegroupactive b"))
    bind(mod .. " + P", hl.dsp.exec_raw("changegroupactive f"))

    bind(mod .. " + ugrave", exec('hyprctl keyword general:layout "dwindle"'))
    bind(mod .. " + SHIFT + ugrave", exec('hyprctl keyword general:layout "master"'))

    local workspace_keys = {
      ampersand = 1,
      eacute = 2,
      quotedbl = 3,
      apostrophe = 4,
      parenleft = 5,
      minus = 6,
      egrave = 7
    }

    for key, workspace in pairs(workspace_keys) do
      bind(mod .. " + " .. key, hl.dsp.exec_raw("workspace " .. workspace))
      bind(mod .. " + SHIFT + " .. key, hl.dsp.exec_raw("movetoworkspacesilent " .. workspace))
    end

    bind(mod .. " + S", hl.dsp.workspace.toggle_special("space"))
    bind(mod .. " + CTRL + S", hl.dsp.exec_raw("movetoworkspacesilent special:space"))

    bind(mod .. " + Z", hl.dsp.workspace.toggle_special("terminal"))
    bind(mod .. " + CTRL + Z", hl.dsp.exec_raw("movetoworkspacesilent special:terminal"))

    bind(mod .. " + X", hl.dsp.workspace.toggle_special("cross"))
    bind(mod .. " + CTRL + X", hl.dsp.exec_raw("movetoworkspacesilent special:cross"))

    bind(mod .. " + SHIFT + S", exec("$HYPRLAND_CONFIG_DIR/grimblast/grimblast copy area; notify-send -t 1300 -a \"Capture d'écran\" \"Screenshot copied to clipboard\""))

    bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
    bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
  end
}
