local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		BufferlineFill = { bg = theme.ui.tabline.bg },
		BufferlineNumbers = {
			bg = not opts.transparent and theme.ui.tabline.bg or "NONE",
			fg = theme.ui.fg_dimmer,
			bold = true,
		},
		BufferlineNumbersSelected = { fg = theme.ui.tabline.indicator, bold = true },
		BufferlineBuffer = { fg = theme.ui.tabline.fg_inactive, bg = theme.ui.tabline.bg_inactive, bold = false },
		BufferlineBufferSelected = {
			fg = theme.ui.tabline.fg_selected,
			bg = theme.ui.tabline.bg_selected,
			bold = true,
		},
		BufferlineIndicatorSelected = { fg = theme.ui.tabline.indicator },
		BufferlineModified = {
			bg = not opts.transparent and theme.ui.tabline.bg or "NONE",
			fg = theme.vcs.changed,
		},
		BufferlineModifiedSelected = { fg = theme.vcs.changed, bg = theme.ui.tabline.bg_selected },
		BufferlineCloseButton = {
			bg = not opts.transparent and theme.ui.tabline.bg or "NONE",
			fg = theme.ui.fg_dimmer,
			bold = false,
		},
		BufferlineCloseButtonSelected = { fg = theme.ui.picker, bold = true },
		BufferlineTab = { fg = theme.ui.tabline.fg_inactive, bg = theme.ui.tabline.bg },
		BufferlineTabClose = { fg = theme.ui.picker, bg = theme.ui.tabline.bg },
		BufferlineTabSelected = { fg = theme.ui.tabline.fg_selected, bg = theme.ui.tabline.bg_selected, bold = true },
		BufferlineTabSeparator = { fg = theme.ui.tabline.bg, bg = theme.ui.tabline.bg },
		BufferlineTabSeparatorSelected = { fg = theme.ui.tabline.bg, bg = theme.ui.tabline.bg },
		BufferlineSeparator = { fg = theme.ui.tabline.bg, bg = theme.ui.tabline.bg },
		BufferlineSeparatorSelected = { fg = theme.ui.tabline.bg, bg = theme.ui.tabline.bg },
	}
end

return M
