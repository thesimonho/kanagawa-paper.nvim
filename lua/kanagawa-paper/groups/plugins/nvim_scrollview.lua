local color = require("kanagawa-paper.lib.color")
local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		ScrollView = { bg = theme.ui.scrollbar },
		ScrollViewHover = { bg = color(theme.ui.scrollbar):brighten(0.1):to_hex() },

		ScrollViewCursor = { fg = theme.ui.fg },
		ScrollViewMarks = { fg = theme.ui.mark },
		ScrollViewFolds = { fg = theme.ui.nontext },
		ScrollViewSearch = { fg = theme.ui.bg_search },

		ScrollViewConflictsTop = { fg = theme.diag.error },
		ScrollViewConflictsMiddle = { fg = theme.diag.error },
		ScrollViewConflictsBottom = { fg = theme.diag.error },

		ScrollViewKeywordsFix = { link = "DiagnosticSignError" },
		ScrollViewKeywordsHack = { link = "DiagnosticSignWarn" },
		ScrollViewKeywordsTodo = { link = "DiagnosticSignHint" },
		ScrollViewKeywordsWarn = { link = "DiagnosticSignWarn" },
		ScrollViewKeywordsXxx = { link = "DiagnosticSignInfo" },
	}
end

return M
