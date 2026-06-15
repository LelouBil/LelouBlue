---@class HyprlandPrograms
---@field main_mod string
---@field terminal string
---@field file_manager string
---@field menu string
---@type HyprlandPrograms
return {
  main_mod = "SUPER",
  terminal = "kitty -1",
  file_manager = "dolphin",
  menu = 'killall wofi || uwsm app -- wofi -i --conf "$WOFI_CONFIG_FILE" --style "$WOFI_STYLE_FILE"'
}
