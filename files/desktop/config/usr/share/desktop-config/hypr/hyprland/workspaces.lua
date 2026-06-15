---@class HyprlandWorkspacesModule
---@field setup fun(programs: HyprlandPrograms)
---@type HyprlandWorkspacesModule
return {
  ---@param programs HyprlandPrograms
  setup = function(programs)
    hl.workspace_rule({ workspace = "1", persistent = true, default = true, monitor = "0" })
    hl.workspace_rule({ workspace = "2", persistent = true, monitor = "0" })
    hl.workspace_rule({ workspace = "3", persistent = true, monitor = "1" })
    hl.workspace_rule({ workspace = "4", persistent = true, monitor = "1" })

    hl.workspace_rule({ workspace = "special:space", persistent = true })
    hl.workspace_rule({ workspace = "special:terminal", persistent = true, on_created_empty = programs.terminal })
    hl.workspace_rule({ workspace = "special:cross", persistent = true })
  end
}
