local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		NeogitHunkHeader = { fg = theme.syn.constant },
		NeogitHunkHeaderCursor = { fg = theme.syn.fun, bg = theme.ui.bg_cursorline, bold = true },
		NeogitHunkHeaderHighlight = { fg = theme.syn.fun, bold = true },
	}
end

return M
