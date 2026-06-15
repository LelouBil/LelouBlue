---@class HyprlandLayoutModule
---@field setup fun()
---@type HyprlandLayoutModule
return {
  setup = function()
    hl.config({
      dwindle = {
        preserve_split = true
      },
      master = {
        new_status = "inherit",
        new_on_top = false,
        orientation = "left"
      }
    })
  end
}
