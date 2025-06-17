-----------------------------------------------------------------------------
--- Kanagawa Paper Canvas
--- Upstream: https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/wezterm_tabline/kanagawa-paper-canvas.lua
--- URL: https://github.com/michaelbrusegard/tabline.wez
-----------------------------------------------------------------------------

local M = {}

M = {
  normal_mode = {
    a = { fg = "#ecece8", bg = "#618bb6" },
    b = { fg = "#618bb6", bg = "#ecece8" },
    c = { fg = "#858479", bg = "#cbc8bc" },
  },
  copy_mode = {
    a = { fg = "#ecece8", bg = "#b35560" },
    b = { fg = "#b35560", bg = "#ecece8" },
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
    inactive_hover = { fg = '#ac7085', bg = '#e1e1de' },
  },
  ansi = {
    "#4c4c65",
    "#b35560",
    "#57786c",
    "#a67337",
    "#719ac2",
    "#ac7085",
    "#526c79",
    "#858479",
  },
  brights = {
    "#5c5c75",
    "#c75f6b",
    "#618679",
    "#b67e3d",
    "#86aed7",
    "#b57e91",
    "#5d7a89",
    "#919084",
  },
}

return M
