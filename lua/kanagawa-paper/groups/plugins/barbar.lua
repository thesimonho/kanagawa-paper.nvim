local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		BufferInactive = { fg = theme.ui.tabline.fg_inactive, bg = theme.ui.tabline.bg_inactive, bold = false },
		BufferInactiveSign = { fg = theme.ui.tabline.bg, bg = theme.ui.tabline.bg },
		BufferInactiveBtn = { bg = theme.ui.tabline.bg_inactive, fg = theme.ui.tabline.fg_inactive },
		BufferInactiveMod = { link = "BufferInactive" },
		BufferInactiveModBtn = { bg = theme.ui.tabline.bg_inactive, fg = theme.vcs.changed },
		BufferInactiveTarget = { bg = theme.ui.tabline.bg_inactive, fg = theme.ui.picker, bold = true },
		BufferInactiveIndex = { bg = theme.ui.tabline.bg_inactive, fg = theme.ui.tabline.fg_inactive, bold = true },
		BufferInactiveNumber = { bg = theme.ui.tabline.bg_inactive, fg = theme.ui.tabline.fg_inactive, bold = true },
		BufferCurrent = { fg = theme.ui.tabline.fg_selected, bg = theme.ui.tabline.bg_selected, bold = true },
		BufferCurrentBtn = { bg = theme.ui.tabline.bg_selected, fg = theme.ui.picker, bold = true },
		BufferCurrentSign = { bg = theme.ui.tabline.indicator, fg = theme.ui.tabline.indicator },
		BufferCurrentMod = { link = "BufferCurrent" },
		BufferCurrentModBtn = { fg = theme.vcs.changed, bg = theme.ui.tabline.bg_selected },
		BufferCurrentTarget = { bg = theme.ui.tabline.bg_selected, fg = theme.ui.picker, bold = true },
		BufferCurrentIndex = { bg = theme.ui.tabline.bg_selected, fg = theme.ui.tabline.fg_selected, bold = true },
		BufferCurrentNumber = { bg = theme.ui.tabline.bg_selected, fg = theme.ui.tabline.fg_selected, bold = true },
		BufferCurrentHINT = { bg = theme.ui.tabline.bg_selected, fg = theme.diag.hint },
		BufferCurrentINFO = { bg = theme.ui.tabline.bg_selected, fg = theme.diag.info },
		BufferCurrentWARN = { bg = theme.ui.tabline.bg_selected, fg = theme.diag.warning },
		BufferCurrentERROR = { bg = theme.ui.tabline.bg_selected, fg = theme.diag.error },
		BufferCurrentADDED = { bg = theme.ui.tabline.bg_selected, fg = theme.vcs.added },
		BufferCurrentCHANGED = { bg = theme.ui.tabline.bg_selected, fg = theme.vcs.changed },
		BufferCurrentDELETED = { bg = theme.ui.tabline.bg_selected, fg = theme.vcs.removed },
		BufferAlternate = { bg = theme.ui.tabline.bg_alternate, fg = theme.ui.tabline.fg_alternate },
		BufferAlternateSign = { link = "BufferAlternate" },
		BufferAlternateBtn = { link = "BufferAlternate" },
		BufferAlternateMod = { link = "BufferAlternate" },
		BufferAlternateModBtn = { bg = theme.ui.tabline.bg_alternate, fg = theme.vcs.changed },
		BufferAlternateTarget = { bg = theme.ui.tabline.bg_alternate, fg = theme.ui.picker, bold = true },
		BufferAlternateIndex = { bg = theme.ui.tabline.bg_alternate, fg = theme.ui.tabline.fg_alternate, bold = true },
		BufferAlternateNumber = { bg = theme.ui.tabline.bg_alternate, fg = theme.ui.tabline.fg_alternate, bold = true },
		BufferTabpages = { bg = theme.ui.tabline.bg, fg = theme.ui.tabline.fg_selected, bold = true },
		BufferTabpageFill = { bg = theme.ui.tabline.bg },
		BufferTabpagesSep = { link = "BufferTabpages" },
	}
end

return M
