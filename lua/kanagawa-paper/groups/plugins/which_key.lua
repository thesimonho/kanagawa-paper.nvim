local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		WhichKey = { fg = theme.ui.picker },
		WhichKeyBorder = { bg = theme.ui.float.bg, fg = theme.ui.float.fg_border },
		WhichKeyIcon = { link = "Label" },
		WhichKeyTitle = { bg = theme.ui.picker, fg = theme.ui.fg_reverse, bold = true },
	}
end

return M
