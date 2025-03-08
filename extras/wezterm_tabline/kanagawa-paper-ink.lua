-----------------------------------------------------------------------------
--- Kanagawa Paper Ink
--- Upstream: https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/wezterm_tabline/kanagawa-paper-ink.lua
--- URL: https://github.com/michaelbrusegard/tabline.wez
-----------------------------------------------------------------------------

local M = {}

M.theme_overrides = {
  normal_mode = {
    a = { fg = "#363646", bg = "#c4b28a" },
    b = { fg = "#c4b28a", bg = "#363646" },
    c = { fg = "#9e9b93", bg = "#2A2A37" },
  },
  copy_mode = {
    a = { fg = "#363646", bg = "#c4746e" },
    b = { fg = "#c4746e", bg = "#363646" },
    c = { fg = "#9e9b93", bg = "#2A2A37" },
  },
  search_mode = {
    a = { fg = "#363646", bg = "#938AA9" },
    b = { fg = "#938AA9", bg = "#363646" },
    c = { fg = "#9e9b93", bg = "#2A2A37" },
  },
  window_mode = {
    a = { fg = "#363646", bg = "#658594" },
    b = { fg = "#658594", bg = "#363646" },
    c = { fg = "#9e9b93", bg = "#2A2A37" },
  },
  resize_mode = {
    a = { fg = "#363646", bg = "#b6927b" },
    b = { fg = "#b6927b", bg = "#363646" },
    c = { fg = "#9e9b93", bg = "#2A2A37" },
  },
  tab = {
    active = { fg = '#c4b28a', bg = '#1F1F28', bold = true },
    inactive = { fg = '#9e9b93', bg = '#2A2A37' },
    inactive_hover = { fg = '#a292a3', bg = '#1F1F28' },
  }
}

return M
