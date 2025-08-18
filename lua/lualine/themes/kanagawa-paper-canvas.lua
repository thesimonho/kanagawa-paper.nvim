local colors = require("kanagawa-paper.colors").setup({ _theme = "canvas" })
local theme = colors.theme

return {
	normal = {
		a = { bg = theme.modes.normal, fg = theme.ui.bg_p2 },
		b = { bg = theme.ui.bg_p2, fg = theme.modes.normal },
		c = { bg = theme.ui.bg_statusline, fg = theme.ui.fg },
	},
	insert = {
		a = { bg = theme.modes.insert, fg = theme.ui.bg },
		b = { bg = theme.ui.bg_p2, fg = theme.modes.insert },
	},
	command = {
		a = { bg = theme.modes.command, fg = theme.ui.bg },
		b = { bg = theme.ui.bg_p2, fg = theme.modes.command },
	},
	visual = {
		a = { bg = theme.modes.visual, fg = theme.ui.bg },
		b = { bg = theme.ui.bg_p2, fg = theme.modes.visual },
	},
	replace = {
		a = { bg = theme.modes.replace, fg = theme.ui.bg },
		b = { bg = theme.ui.bg_p2, fg = theme.modes.replace },
	},
	inactive = {
		a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dark },
		b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dark, gui = "bold" },
		c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dark },
	},
}
