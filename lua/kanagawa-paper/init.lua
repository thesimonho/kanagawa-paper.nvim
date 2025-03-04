local config = require("kanagawa-paper.config")

local M = {}

---@param opts? KanagawaConfig
---@return KanagawaColors, KanagawaGroups, KanagawaConfig
function M.load(opts)
	print("init load")
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
			print("current theme is " .. opts._theme)
			opts._theme = bg == "light" and "canvas" or "ink"
			print("changed theme to " .. opts._theme)
		else
			vim.o.background = theme_bg
			print("set background to " .. theme_bg)
		end
	end

	return require("kanagawa-paper.themes").setup(opts)
end

M.setup = config.setup

return M
