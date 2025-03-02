if vim.o.background == "light" then
	return require("lualine.themes.kanagawa-paper-canvas")
end
return require("lualine.themes.kanagawa-paper-ink")
