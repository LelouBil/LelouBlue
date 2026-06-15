---@class HyprlandWindowrulesModule
---@field setup fun()
---@type HyprlandWindowrulesModule
return {
  setup = function()

  hl.window_rule({
    name = "nm-connection-editor",
    match = {
      class = "(nm-connection-editor)"
    },
    float = true
  })

  hl.window_rule({
    name = "nm-connection-editor",
    match = {
      class = "(nm-connection-editor)",
      title = "(Network Connections)"
    },
    size = "(monitor_w*0.2) (monitor_h*0.4)",
    move = "((monitor_w*1)-(monitor_w*0.25)) ((monitor_h*0.06))"
  })

  hl.window_rule({
    name = "pinentry",
    match = {
      class = "(pinentry-.*)",
      float = 1
    },
    stay_focused = true,
    center = true
  })

  hl.window_rule({
    name = "polkit",
    match = {
      class = "(org.kde.polkit-kde-authentication-agent-1)"
    },
    stay_focused = true,
    center = true,
    size = "(monitor_w*0.4) (monitor_h*0.2)"
  })

  hl.layer_rule({
    name = "waybar",
    match = {
      namespace = "waybars"
    },
    animation = "slide"
  })

  hl.layer_rule({
    name = "notifications",
    match = {
      namespace = "notifications"
    },
    animation = "slide"
  })

  hl.window_rule({
    name = "jb-toolbox",
    match = {
      class = "(jetbrains-toolbox)",
      float = 1
    },
    move = "((monitor_w*1)-(monitor_w*0.25)) ((monitor_h*0.1))",
    animation = "slide"
  })

  hl.window_rule({
    name = "copyq_center",
    match = {
      class = "(com.github.hluk.copyq)"
    },
    float = true,
    center = true,
    size = "(monitor_w*0.2) (monitor_h*0.35)"
  })

  hl.window_rule({
    name = "xwayland-video-bridge-fixes",
    match = {
      class = "xwaylandvideobridge"
    },
    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = "1 1",
    opacity = 0.0
  })

  hl.window_rule({
    name = "blex_center",
    match = {
      class = "(toolBLEx.toolblex)"
    },
    float = true,
    center = true,
    size = "(monitor_w*0.5) (monitor_h*0.5)"
  })
  end
}
