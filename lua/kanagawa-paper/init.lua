local config = require("kanagawa-paper.config")

local M = {}

--- load the colorscheme
---@param opts? KanagawaConfig
---@return KanagawaColors, KanagawaGroups, KanagawaConfig
function M.load(opts)
	if opts then
		config.extend(opts)
	end

	-- only needed to clear when not the default colorscheme
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "kanagawa-paper-" .. config.options.theme

	if config.options.theme == "ink" then
		vim.o.background = "dark"
	elseif config.options.theme == "canvas" then
		vim.o.background = "light"
	else
		vim.notify("Invalid theme: " .. config.options.theme, vim.log.levels.ERROR)
	end

	local colors = require("kanagawa-paper.colors").setup(config.options)
	local groups = require("kanagawa-paper.groups").setup(colors, config.options)

	require("kanagawa-paper.groups").highlight(groups, colors, config)

	return colors, groups, config
end

M.setup = config.setup

return M
