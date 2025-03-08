local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		TreesitterContext = { bg = theme.ui.bg_p2 },
		TreesitterContextBottom = { fg = "NONE", bg = theme.ui.bg_p2 },
		TreesitterContextLineNumber = { fg = theme.ui.nontext, bg = theme.ui.bg_p2 },
		TreesitterContextSeparator = { fg = theme.ui.win_separator },
	}
end

return M
