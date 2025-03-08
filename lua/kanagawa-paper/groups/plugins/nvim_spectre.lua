local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		SpectreFaint = { fg = theme.ui.fg_gray, italic = false },
	}
end

return M
