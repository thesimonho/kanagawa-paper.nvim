local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		SpectreFaint = { fg = theme.ui.fg_dim, italic = false },
	}
end

return M
