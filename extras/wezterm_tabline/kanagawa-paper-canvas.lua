-----------------------------------------------------------------------------
--- Kanagawa Paper Canvas
--- Upstream: https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/wezterm_tabline/kanagawa-paper-canvas.lua
--- URL: https://github.com/michaelbrusegard/tabline.wez
-----------------------------------------------------------------------------

local M = {}

M = {
  normal_mode = {
    a = { fg = "#ecece8", bg = "#929fb9" },
    b = { fg = "#929fb9", bg = "#ecece8" },
    c = { fg = "#9d9992", bg = "#d1cfc5" },
  },
  copy_mode = {
    a = { fg = "#ecece8", bg = "#c58c89" },
    b = { fg = "#c58c89", bg = "#ecece8" },
    c = { fg = "#9d9992", bg = "#d1cfc5" },
  },
  search_mode = {
    a = { fg = "#ecece8", bg = "#c1b4c1" },
    b = { fg = "#c1b4c1", bg = "#ecece8" },
    c = { fg = "#9d9992", bg = "#d1cfc5" },
  },
  window_mode = {
    a = { fg = "#ecece8", bg = "#929fb9" },
    b = { fg = "#929fb9", bg = "#ecece8" },
    c = { fg = "#9d9992", bg = "#d1cfc5" },
  },
  resize_mode = {
    a = { fg = "#ecece8", bg = "#c39e87" },
    b = { fg = "#c39e87", bg = "#ecece8" },
    c = { fg = "#9d9992", bg = "#d1cfc5" },
  },
  tab = {
    active = { fg = '#929fb9', bg = '#e1e1de', bold = true },
    inactive = { fg = '#9d9992', bg = '#d1cfc5' },
    inactive_hover = { fg = '#a690a8', bg = '#e1e1de' },
  },
  ansi = {
    "#b7b7a9",
    "#c58c89",
    "#8ba59e",
    "#b9a679",
    "#91acb8",
    "#a690a8",
    "#929fb9",
    "#b7b7a9",
  },
  brights = {
    "#bebeb0",
    "#c99895",
    "#93aea7",
    "#c2ae7f",
    "#a0bdca",
    "#af9bb0",
    "#9da8c0",
    "#bebeb0",
  },
}

return M
