---@class HyprlandGraphicsModule
---@field setup fun()
---@type HyprlandGraphicsModule
return {
  setup = function()
    hl.config({
      general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,
        col = {
          active_border = "rgb(FFFFFF)",
          inactive_border = "rgb(000000)"
        }
      },
      decoration = {
        rounding = 0,
        inactive_opacity = 0.88,
        blur = {
          enabled = true,
          size = 2,
          passes = 2
        },
        shadow = {
          enabled = true,
          range = 10,
          color = "rgba(00000055)"
        }
      },
      group = {
        groupbar = {
          col = {
            inactive = "rgb(000000)",
            active = "rgb(000000)"
          }
        }
      },
      animations = {
        enabled = true
      }
    })

    hl.window_rule({
      name = "windowrule-1",
      match = {
        fullscreen = 1
      },
      border_color = "rgb(17DCF5)"
    })

    hl.curve("easeOutExpo", {
      type = "bezier",
      points = {
        { 0.16, 1 },
        { 0.3, 1 }
      }
    })

    hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "easeOutExpo", style = "gnomed" })
    hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "easeOutExpo", style = "slide" })
    hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "easeOutExpo", style = "slide" })
    hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
    hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
    hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
    hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "easeOutExpo", style = "slide" })
    hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4, bezier = "easeOutExpo", style = "slidevert" })
  end
}
