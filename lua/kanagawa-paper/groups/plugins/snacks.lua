local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		SnacksIndent = { fg = theme.ui.indent },
		SnacksIndentScope = { fg = theme.ui.indent_scope },
		SnacksIndentChunk = { fg = theme.ui.indent_scope },
		SnacksPickerCursorLine = { bg = theme.ui.float.bg },
		SnacksPickerListCursorLine = { bg = theme.ui.bg_cursorline_alt },
		SnacksPickerPreviewCursorLine = { bg = theme.ui.bg_cursorline_alt },
	}
end

return M
