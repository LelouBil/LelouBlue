require("hyprland.programs")
function monitors()
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

function config()
  hl.config({
    general = {
      allow_tearing = true,
      resize_on_border = true
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
      allow_session_lock_restore = 0,
      anr_missed_pings = 3,
      focus_on_activate = true,
      animate_manual_resizes = true,
      font_family = "VCR OSD Mono"
    }
  })
end

monitors()
config()
