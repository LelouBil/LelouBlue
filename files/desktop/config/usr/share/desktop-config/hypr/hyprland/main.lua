---@type HyprlandPrograms
local programs = require("hyprland.programs")
---@type HyprlandAutostartModule
local autostart = require("hyprland.autostart")
---@type HyprlandLayoutModule
local layout = require("hyprland.layout")
---@type HyprlandGraphicsModule
local graphics = require("hyprland.graphics")
---@type HyprlandInputModule
local input = require("hyprland.input")
---@type HyprlandBindsModule
local binds = require("hyprland.binds")
---@type HyprlandSystemBindsModule
local system_binds = require("hyprland.system-binds")
---@type HyprlandWindowrulesModule
local windowrules = require("hyprland.windowrules")
---@type HyprlandWorkspacesModule
local workspaces = require("hyprland.workspaces")

local function monitors()
  hl.monitor({
    output = "eDP-1",
    mode = "2560x1600@165",
    position = "0x0",
    scale = 1.6
  })

  hl.monitor({
    output = "DP-2",
    mode = "highres",
    position = "auto-right",
    scale = 1
  })

  hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
  })
end

local function config()
  hl.config({
    general = {
      allow_tearing = true,
      resize_on_border = true,
      layout = "master"
    },
    debug = {
      enable_stdout_logs = true,
      disable_logs = false
    },
    xwayland = {
      force_zero_scaling = true
    },
    misc = {
      force_default_wallpaper = 0,
      disable_hyprland_logo = true,
      vrr = 1,
      allow_session_lock_restore = true,
      on_focus_under_fullscreen = 2,
      anr_missed_pings = 3,
      focus_on_activate = true,
      animate_manual_resizes = true,
      font_family = "VCR OSD Mono"
    }
  })
end

monitors()
config()

autostart.setup()
layout.setup()
graphics.setup()
input.setup(programs, binds, system_binds)
windowrules.setup()
workspaces.setup(programs)
