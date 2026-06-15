---@class HyprlandInputModule
---@field setup fun(programs: HyprlandPrograms, binds: HyprlandBindsModule, system_binds: HyprlandSystemBindsModule)
---@type HyprlandInputModule
return {
  ---@param programs HyprlandPrograms
  ---@param binds HyprlandBindsModule
  ---@param system_binds HyprlandSystemBindsModule
  setup = function(programs, binds, system_binds)
    hl.config({
      input = {
        kb_layout = "fr",
        kb_variant = "oss",
        kb_model = "pc105",
        kb_options = "",
        kb_rules = "",
        accel_profile = "adaptive",
        follow_mouse = 1,
        float_switch_override_focus = 0,
        mouse_refocus = false,
        numlock_by_default = true,
        touchpad = {
          natural_scroll = true,
          scroll_factor = 0.2
        },
        sensitivity = 0
      }
    })

    hl.gesture({
      fingers = 3,
      direction = "horizontal",
      action = "workspace"
    })

    binds.setup(programs)
    system_binds.setup(programs)
  end
}
