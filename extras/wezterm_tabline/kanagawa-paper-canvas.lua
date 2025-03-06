-----------------------------------------------------------------------------
--- Kanagawa Paper Canvas
--- Upstream: https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/wezterm_tabline/kanagawa-paper-canvas.lua
--- URL: https://github.com/michaelbrusegard/tabline.wez
-----------------------------------------------------------------------------

local M = {}

M.theme_overrides = {
  normal_mode = {
    a = { fg = "#ecece8", bg = "#618bb6" },
    b = { fg = "#618bb6", bg = "#ecece8" },
    c = { fg = "#858479", bg = "#cbc8bc" },
  },
  copy_mode = {
    a = { fg = "#ecece8", bg = "#ba4e5a" },
    b = { fg = "#ba4e5a", bg = "#ecece8" },
    c = { fg = "#858479", bg = "#cbc8bc" },
  },
  search_mode = {
    a = { fg = "#ecece8", bg = "#a398bf" },
    b = { fg = "#a398bf", bg = "#ecece8" },
    c = { fg = "#858479", bg = "#cbc8bc" },
  },
  window_mode = {
    a = { fg = "#ecece8", bg = "#526994" },
    b = { fg = "#526994", bg = "#ecece8" },
    c = { fg = "#858479", bg = "#cbc8bc" },
  },
  resize_mode = {
    a = { fg = "#ecece8", bg = "#b8805e" },
    b = { fg = "#b8805e", bg = "#ecece8" },
    c = { fg = "#858479", bg = "#cbc8bc" },
  },
  tab = {
    active = { fg = '#618bb6', bg = '#e1e1de', bold = true },
    inactive = { fg = '#858479', bg = '#cbc8bc' },
    inactive_hover = { fg = '#a85b76', bg = '#e1e1de' },
  }
}

return M
