-- NOTE: left here for backwards compatibility
vim.notify(
	"Using default kanagawa-paper lualine theme.\nPlease change your lualine config to use one of the new themes:\nkanagawa-paper-ink or kanagawa-paper-canvas",
	vim.log.levels.INFO
)

return require("lualine.themes.kanagawa-paper-ink")
