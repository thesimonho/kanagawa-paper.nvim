local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		NeoTreeNormal = { link = "NormalFloat" },
		NeoTreeNormalNC = { link = "NormalFloat" },
		NeoTreeFloatTitle = { fg = theme.ui.bg_m1, bg = theme.accent.accent1, bold = true },
		NeoTreeFloatBorder = { fg = theme.ui.bg_dim, bg = theme.ui.float.bg_border },
		NeoTreeCursorLine = { bg = theme.ui.bg_cursorline_alt },
		NeoTreeWinSeparator = { link = "WinSeparator" },
		NeoTreeTabInactive = { link = "TabLine" },
		NeoTreeTabActive = { link = "TabLineSel" },
		NeoTreeTabSeparatorInactive = { link = "NeoTreeTabInactive" },
		NeoTreeTabSeparatorActive = { link = "NeoTreeTabActive" },
		NeoTreeRootName = { fg = theme.accent.accent5, bold = true },
		NeoTreeDirectoryName = { fg = theme.accent.accent1 },
		NeoTreeDirectoryIcon = { fg = theme.accent.accent1 },
		NeoTreeModified = { link = "NeoTreeGitModified" },
		NeoTreeGitModified = { fg = theme.vcs.changed },
		NeoTreeGitAdded = { fg = theme.vcs.added },
		NeoTreeGitDeleted = { fg = theme.vcs.removed },
		NeoTreeGitStaged = { fg = theme.vcs.added },
		NeoTreeGitConflict = { fg = theme.diag.error },
		NeoTreeGitUntracked = { link = "NeoTreeGitModified", default = true },
		NeoTreeGitUnstaged = { link = "NeoTreeGitModified", default = true },
		NeoTreeIndentMarker = { fg = theme.ui.indent },
		NeoTreeFileNameOpened = { fg = theme.ui.special, italic = true },
		NeoTreeSymbolicLinkTarget = { link = "Type" },
		NeoTreeDotfile = { fg = theme.syn.comment },
	}
end

return M
