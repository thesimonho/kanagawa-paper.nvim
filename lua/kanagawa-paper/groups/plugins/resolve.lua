local color = require("kanagawa-paper.lib.color")

local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		ResolveOursMarker = { bg = theme.diff.conflict_ours, fg = theme.ui.bg, bold = true },
		ResolveTheirsMarker = { bg = theme.diff.conflict_theirs, fg = theme.ui.bg, bold = true },
		ResolveAncestorMarker = { bg = theme.diff.conflict_ancestor, fg = theme.ui.bg, bold = true },
		ResolveSeparatorMarker = { bg = theme.ui.bg_dim, fg = theme.ui.fg },
		ResolveOursSection = { bg = color(theme.diff.conflict_ours):blend(theme.ui.bg, 0.6):to_hex() },
		ResolveTheirsSection = { bg = color(theme.diff.conflict_theirs):blend(theme.ui.bg, 0.6):to_hex() },
		ResolveAncestorSection = { bg = color(theme.diff.conflict_ancestor):blend(theme.ui.bg, 0.6):to_hex() },
	}
end

return M
