local config = require("kanagawa-paper.config")

local M = {}

-- BUG: user theme choice is not respected. its overriden by the background color selection
---@param opts? KanagawaConfig
---@return KanagawaColors, KanagawaGroups, KanagawaConfig
function M.load(opts)
	opts = require("kanagawa-paper.config").extend(opts)
	local bg = vim.o.background
	local theme_bg = opts.theme == "canvas" and "light" or "dark"

	if bg ~= theme_bg then
		if vim.g.colors_name == "kanagawa-paper-" .. opts.theme then
			opts.theme = bg == "light" and "canvas" or "ink"
		else
			vim.o.background = theme_bg
		end
	end

	return require("kanagawa-paper.themes").setup(opts)
end

M.setup = config.setup

return M
