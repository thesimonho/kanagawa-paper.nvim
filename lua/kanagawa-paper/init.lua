local config = require("kanagawa-paper.config")

local M = {}

--- load the colorscheme
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

	-- create terminal highlights
	require("kanagawa-paper.groups").highlight(groups, config.options.terminalColors and colors.theme.term or {})
end

M.setup = config.setup

return M
