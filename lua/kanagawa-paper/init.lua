local util = require("kanagawa-paper.lib.util")
local config = require("kanagawa-paper.config")

local M = {}

---@param opts? KanagawaConfig
---@return KanagawaColors, KanagawaGroups, KanagawaConfig
function M.load(opts)
	opts = require("kanagawa-paper.config").extend(opts)

	local bg = vim.o.background
	local theme_bg

	if opts._theme == "ink" then
		theme_bg = "dark"
	elseif opts._theme == "canvas" then
		theme_bg = "light"
	else -- auto
		theme_bg = vim.o.background
	end

	if bg ~= theme_bg then
		if vim.g.colors_name == "kanagawa-paper-" .. opts._theme then
			opts._theme = bg == "light" and "canvas" or "ink"
		else
			vim.o.background = theme_bg
		end
	end

	if opts.integrations.wezterm.enabled then
		util.write(
			vim.fn.expand(opts.integrations.wezterm.path),
			vim.o.background == "light" and "kanagawa-paper-canvas" or "kanagawa-paper-ink"
		)
	else
		if vim.fn.filereadable(vim.fn.expand(opts.integrations.wezterm.path)) == 1 then
			os.remove(vim.fn.expand(opts.integrations.wezterm.path))
		end
	end

	return require("kanagawa-paper.themes").setup(opts)
end

M.setup = config.setup

return M
