local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		SnacksIndent = { fg = theme.ui.indent },
		SnacksIndentScope = { fg = theme.ui.indent_scope },
		SnacksIndentChunk = { fg = theme.ui.indent_scope },
	}
end

return M
