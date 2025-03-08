local color = require("kanagawa-paper.lib.color")

local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		Headline1 = { bg = tostring(color(theme.rainbow.rainbow1):brighten(-0.4)), fg = theme.ui.fg_dark, bold = true },
		Headline2 = { bg = tostring(color(theme.rainbow.rainbow2):brighten(-0.4)), fg = theme.ui.fg_dark, bold = true },
		Headline3 = { bg = tostring(color(theme.rainbow.rainbow3):brighten(-0.4)), fg = theme.ui.fg_dark, bold = true },
		Headline4 = { bg = tostring(color(theme.rainbow.rainbow4):brighten(-0.4)), fg = theme.ui.fg_dark, bold = true },
		Headline5 = { bg = tostring(color(theme.rainbow.rainbow5):brighten(-0.4)), fg = theme.ui.fg_dark, bold = true },
		Headline6 = { bg = tostring(color(theme.rainbow.rainbow6):brighten(-0.4)), fg = theme.ui.fg_dark, bold = true },
	}
end

return M
