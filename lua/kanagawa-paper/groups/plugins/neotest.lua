local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		NeotestAdapterName = { fg = theme.syn.special3 },
		NeotestDir = { fg = theme.syn.fun },
		NeotestExpandMarker = { fg = theme.syn.punct, bold = true },
		NeotestFailed = { fg = theme.diag.error },
		NeotestFile = { fg = theme.syn.fun },
		NeotestFocused = { bold = true, underline = false },
		NeotestIndent = { fg = theme.ui.indent, bold = true },
		NeotestMarked = { fg = theme.diag.warning, italic = true },
		NeotestNamespace = { fg = theme.syn.fun },
		NeotestPassed = { fg = theme.diag.ok },
		NeotestRunning = { fg = theme.vcs.changed },
		NeotestWinSelect = { fg = theme.ui.picker },
		NeotestSkipped = { fg = theme.syn.special1 },
		NeotestTarget = { fg = theme.syn.special3 },
		NeotestTest = { fg = theme.ui.float.fg },
		NeotestUnknown = { fg = theme.syn.deprecated },
		NeotestWatching = { fg = theme.vcs.changed },
	}
end

return M
