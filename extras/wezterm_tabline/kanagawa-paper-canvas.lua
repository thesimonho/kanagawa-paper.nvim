-----------------------------------------------------------------------------
--- Kanagawa Paper Canvas
--- Upstream: https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/wezterm_tabline/kanagawa-paper-canvas.lua
--- URL: https://github.com/michaelbrusegard/tabline.wez
-----------------------------------------------------------------------------

local M = {}

M = {
  normal_mode = {
    a = { fg = "#ecece8", bg = "#7e8faf" },
    b = { fg = "#7e8faf", bg = "#ecece8" },
    c = { fg = "#8e8a80", bg = "#d1cfc5" },
  },
  copy_mode = {
    a = { fg = "#ecece8", bg = "#c27672" },
    b = { fg = "#c27672", bg = "#ecece8" },
    c = { fg = "#8e8a80", bg = "#d1cfc5" },
  },
  search_mode = {
    a = { fg = "#ecece8", bg = "#9e7e98" },
    b = { fg = "#9e7e98", bg = "#ecece8" },
    c = { fg = "#8e8a80", bg = "#d1cfc5" },
  },
  window_mode = {
    a = { fg = "#ecece8", bg = "#7e8faf" },
    b = { fg = "#7e8faf", bg = "#ecece8" },
    c = { fg = "#8e8a80", bg = "#d1cfc5" },
  },
  resize_mode = {
    a = { fg = "#ecece8", bg = "#b28d77" },
    b = { fg = "#b28d77", bg = "#ecece8" },
    c = { fg = "#8e8a80", bg = "#d1cfc5" },
  },
  tab_mode = {
    a = { fg = "#ecece8", bg = "#7b958e" },
    b = { fg = "#7b958e", bg = "#ecece8" },
    c = { fg = "#8e8a80", bg = "#d1cfc5" },
  },
  tab = {
    active = { fg = '#7e8faf', bg = '#e1e1de', bold = true },
    inactive = { fg = '#8e8a80', bg = '#d1cfc5' },
    inactive_hover = { fg = '#9e7e98', bg = '#e1e1de' },
  },
  ansi = {
    "#8e8a80",
    "#c27672",
    "#7b958e",
    "#a7956a",
    "#809ba7",
    "#9e7e98",
    "#7e8faf",
    "#b7b7a9",
  },
  brights = {
    "#99958a",
    "#c68582",
    "#84a098",
    "#b29f71",
    "#91b0bd",
    "#a989a3",
    "#8a9ab8",
    "#bebeb0",
  },
}

return M
