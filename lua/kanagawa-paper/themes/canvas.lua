local M = {}

M.get = function(opts, palette)
	return {
		modes = {
			normal = palette.canvasTeal2,
			insert = palette.canvasRed,
			visual = palette.canvasBlue5,
			replace = palette.canvasRed,
			command = palette.canvasTeal2,
		},
		ui = {
			fg = palette.canvasInk1,
			fg_gray = palette.canvasWhite5,
			fg_dark = palette.canvasInk0,
			fg_dim = palette.canvasInk2,
			fg_reverse = palette.canvasGray,
			bg_m4 = palette.canvasGray3,
			bg_m3 = palette.canvasWhite0,
			bg_m2 = palette.canvasWhite1,
			bg_m1 = palette.canvasWhite2,
			bg_dim = palette.canvasWhite2,
			bg = palette.canvasWhite3,
			bg_p1 = palette.canvasWhite4,
			bg_p2 = palette.canvasWhite5,
			bg_gutter = opts.gutter and palette.canvasWhite4 or "none",
			bg_search = palette.canvasViolet1,
			bg_cursorline = palette.canvasWhite1,
			bg_visual = palette.canvasViolet1,
			bg_statusline = palette.canvasWhite0,
			header1 = palette.canvasViolet1,
			header2 = palette.canvasOrange,
			special = palette.canvasTeal1,
			nontext = palette.canvasGray2,
			whitespace = palette.canvasViolet1,
			win_separator = palette.canvasViolet1,
			indent = palette.canvasViolet1,
			indent_scope = palette.canvasViolet3,
			picker = palette.canvasRed,
			mark = palette.canvasGreen3,
			scrollbar = palette.canvasGray2,
			tabline = {
				bg = palette.canvasWhite1,
				fg_selected = palette.canvasInk0,
				bg_selected = palette.canvasWhite3,
				fg_inactive = palette.canvasGray2,
				bg_inactive = palette.canvasWhite1,
				fg_alternate = palette.canvasPink,
				bg_alternate = palette.canvasWhite1,
				indicator = palette.canvasBlue3,
			},
			pmenu = {
				fg = palette.canvasInk1,
				fg_sel = "none", -- This is important to make highlights pass-through
				bg = palette.canvasWhite2,
				bg_sel = palette.canvasViolet1,
				bg_sbar = palette.canvasWhite2,
				bg_thumb = palette.canvasBlue2,
			},
			float = {
				fg = palette.canvasInk1,
				bg = palette.canvasWhite3,
				fg_border = palette.canvasGray3,
				bg_border = palette.canvasWhite3,
			},
		},
		accent = {
			accent1 = palette.canvasBlue3,
			accent2 = palette.canvasOrange,
			accent3 = palette.canvasAqua,
			accent4 = palette.canvasGreen2,
			accent5 = palette.canvasRed,
		},
		rainbow = {
			rainbow1 = palette.canvasRed,
			rainbow2 = palette.canvasYellow,
			rainbow3 = palette.canvasBlue4,
			rainbow4 = palette.canvasOrange2,
			rainbow5 = palette.canvasGreen,
			rainbow6 = palette.canvasAqua,
			rainbow7 = palette.canvasTeal2,
		},
		syn = {
			attribute = palette.canvasYellow,
			comment = palette.canvasGray3,
			constant = palette.canvasGreen2,
			deprecated = palette.canvasGray2,
			fun = palette.canvasTeal2,
			identifier = palette.canvasYellow,
			keyword = palette.canvasPink,
			member = palette.canvasGray4,
			number = palette.canvasPink,
			operator = palette.canvasRed,
			parameter = palette.canvasInk2,
			preproc = palette.canvasRed,
			punct = palette.canvasGray3,
			regex = palette.canvasRed,
			statement = palette.canvasViolet,
			string = palette.canvasGreen,
			symbol = palette.canvasRed,
			type = palette.canvasAqua,
			variable = "none",
			special1 = palette.canvasTeal2,
			special2 = palette.canvasRed,
			special3 = palette.canvasBlue5,
		},
		vcs = {
			added = palette.canvasGreen2,
			addedDark = palette.autumnGreen,
			removed = palette.canvasRed2,
			removedDark = palette.autumnRed,
			changed = palette.canvasYellow2,
			changedDark = palette.autumnYellow,
		},
		diff = {
			add = palette.canvasGreen3,
			addDark = palette.autumnGreen,
			delete = palette.canvasRed4,
			deleteDark = palette.autumnRed,
			change = palette.canvasYellow2,
			changeDark = palette.autumnYellow,
			text = palette.canvasTeal1,
			textDark = palette.canvasTeal3,
		},
		diag = {
			error = palette.canvasRed3,
			ok = palette.canvasGreen,
			warning = palette.canvasOrange2,
			info = palette.canvasTeal3,
			hint = palette.canvasAqua2,
		},
		term = {
			palette.canvasInk0, -- black
			palette.canvasRed, -- red
			palette.canvasGreen, -- green
			palette.canvasYellow, -- yellow
			palette.canvasBlue4, -- blue
			palette.canvasPink, -- magenta
			palette.canvasAqua, -- cyan
			palette.canvasInk1, -- white
			palette.canvasGray3, -- bright black
			palette.canvasRed2, -- bright red
			palette.canvasGreen2, -- bright green
			palette.canvasYellow2, -- bright yellow
			palette.canvasTeal2, -- bright blue
			palette.canvasViolet4, -- bright magenta
			palette.canvasAqua2, -- bright cyan
			palette.canvasInk2, -- bright white
			palette.canvasOrange2, -- extended color 1
			palette.canvasRed3, -- extended color 2
		},
	}
end
return M
