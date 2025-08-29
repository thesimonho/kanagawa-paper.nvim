local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		TelescopeTitle = { fg = theme.ui.fg_dark, bg = theme.accent.accent1, bold = true },
		TelescopeBorder = { fg = theme.ui.float.fg_border, bg = theme.ui.bg },
		TelescopeSelection = { link = "CursorLineAlt" },
		TelescopeSelectionCaret = { link = "CursorLineNr" },
		TelescopePromptNormal = { bg = theme.ui.bg_p2 },
		TelescopePromptBorder = { fg = theme.ui.bg_p2, bg = theme.ui.bg_p2 },
		TelescopeResultsClass = { link = "Structure" },
		TelescopeResultsStruct = { link = "Structure" },
		TelescopeResultsField = { link = "@field" },
		TelescopeResultsMethod = { link = "Function" },
		TelescopeResultsVariable = { link = "@variable" },
		TelescopeResultsTitle = { fg = theme.ui.fg_dark, bg = theme.accent.accent2, bold = true },
		TelescopeResultsNormal = { fg = theme.ui.fg, bg = theme.ui.bg_p1 },
		TelescopeResultsBorder = { fg = theme.ui.bg_p2, bg = theme.ui.bg_p1 },
		TelescopePreviewTitle = { fg = theme.ui.fg_dark, bg = theme.accent.accent3, bold = true },
		TelescopePreviewNormal = { bg = theme.ui.bg },
		TelescopePreviewBorder = { bg = theme.ui.bg, fg = theme.ui.bg_p2 },
	}
end

return M
