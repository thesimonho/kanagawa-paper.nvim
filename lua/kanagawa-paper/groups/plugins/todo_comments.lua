local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		TodoBgFIX = { fg = theme.ui.bg, bg = theme.diag.error },
		TodoBgHACK = { fg = theme.ui.bg, bg = theme.diag.warning },
		TodoBgNOTE = { fg = theme.ui.bg, bg = theme.diag.hint },
		TodoBgPERF = { fg = theme.ui.bg, bg = theme.syn.identifier },
		TodoBgTEST = { fg = theme.ui.bg, bg = theme.syn.identifier },
		TodoBgTODO = { fg = theme.ui.bg, bg = theme.diag.info },
		TodoBgWARN = { fg = theme.ui.bg, bg = theme.diag.warning },
	}
end

return M
