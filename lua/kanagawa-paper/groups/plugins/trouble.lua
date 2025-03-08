local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		TroubleIndent = { fg = theme.ui.indent },
		TroublePos = { fg = theme.ui.special },
		TroubleCount = { fg = theme.syn.special2 },
	}
end

return M
