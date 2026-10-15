local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		FloatermBorder = { fg = theme.ui.float.fg_border, bg = theme.ui.bg },
	}
end

return M
