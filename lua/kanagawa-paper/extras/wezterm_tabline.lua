local util = require("kanagawa-paper.lib.util")

local M = {}

--- @param colors ThemeColors
function M.generate(colors)
	local wezterm_tabline = util.template(
		[[
-----------------------------------------------------------------------------
--- ${_style_name}
--- Upstream: ${_upstream_url}
--- URL: ${_url}
-----------------------------------------------------------------------------

local M = {}

M.theme_overrides = {
  normal_mode = {
    a = { fg = "${ui.bg_p2}", bg = "${modes.normal}" },
    b = { fg = "${modes.normal}", bg = "${ui.bg_p2}" },
    c = { fg = "${ui.fg_gray}", bg = "${ui.bg_statusline}" },
  },
  copy_mode = {
    a = { fg = "${ui.bg_p2}", bg = "${modes.insert}" },
    b = { fg = "${modes.insert}", bg = "${ui.bg_p2}" },
    c = { fg = "${ui.fg_gray}", bg = "${ui.bg_statusline}" },
  },
  search_mode = {
    a = { fg = "${ui.bg_p2}", bg = "${modes.visual}" },
    b = { fg = "${modes.visual}", bg = "${ui.bg_p2}" },
    c = { fg = "${ui.fg_gray}", bg = "${ui.bg_statusline}" },
  },
  window_mode = {
    a = { fg = "${ui.bg_p2}", bg = "${accent.accent1}" },
    b = { fg = "${accent.accent1}", bg = "${ui.bg_p2}" },
    c = { fg = "${ui.fg_gray}", bg = "${ui.bg_statusline}" },
  },
  resize_mode = {
    a = { fg = "${ui.bg_p2}", bg = "${accent.accent2}" },
    b = { fg = "${accent.accent2}", bg = "${ui.bg_p2}" },
    c = { fg = "${ui.fg_gray}", bg = "${ui.bg_statusline}" },
  },
  tab = {
    active = { fg = '${modes.normal}', bg = '${ui.tabline.bg_selected}', bold = true },
    inactive = { fg = '${ui.fg_gray}', bg = '${ui.bg_statusline}' },
    inactive_hover = { fg = '${ui.tabline.fg_alternate}', bg = '${ui.tabline.bg_selected}' },
  }
}

return M
]],
		colors
	)
	return wezterm_tabline
end

return M
