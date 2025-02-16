local M = {}

M.get = function(opts, palette)
	return {
		modes = {
			normal = palette.dragonYellow,
			insert = palette.dragonRed,
			visual = palette.springViolet1,
			replace = palette.dragonRed,
			command = palette.dragonYellow,
		},
		ui = {
			fg = palette.lotusInk1,
			fg_gray = palette.fujiGray,
			fg_dark = palette.lotusInk0,
			fg_dim = palette.lotusInk2,
			fg_reverse = palette.lotusGray,
			bg_m4 = palette.lotusGray3,
			bg_m3 = palette.lotusWhite0,
			bg_m2 = palette.lotusWhite1,
			bg_m1 = palette.lotusWhite2,
			bg = palette.lotusGray,
			bg_p1 = palette.lotusGray2,
			bg_p2 = palette.lotusGray3,
			bg_dim = palette.lotusWhite1,
			bg_gutter = opts.gutter and palette.lotusWhite4 or "none",
			bg_search = palette.lotusBlue2,
			bg_cursorline = palette.lotusViolet5,
			bg_visual = palette.lotusViolet3,
			bg_statusline = palette.lotusInk1,
			header1 = palette.lotusViolet1,
			header2 = palette.lotusOrange,
			special = palette.lotusViolet2,
			nontext = palette.lotusViolet1,
			whitespace = palette.lotusViolet1,
			win_separator = palette.lotusViolet,
			indent = palette.lotusInk2,
			indent_scope = palette.lotusViolet,
			picker = palette.lotusRed,
			mark = palette.lotusGreen2,
			scrollbar = palette.lotusGray2,
			tabline = {
				bg = palette.lotusWhite4,
				fg_selected = palette.lotusInk0,
				bg_selected = palette.lotusGray,
				fg_inactive = palette.lotusGray2,
				bg_inactive = palette.lotusWhite4,
				fg_alternate = palette.lotusPink,
				bg_alternate = palette.lotusWhite4,
				indicator = palette.lotusBlue3,
			},
			pmenu = {
				fg = palette.lotusInk2,
				fg_sel = "none", -- This is important to make highlights pass-through
				bg = palette.lotusBlue1,
				bg_sel = palette.lotusBlue3,
				bg_sbar = palette.lotusBlue1,
				bg_thumb = palette.lotusBlue2,
			},
			float = {
				fg = palette.lotusInk2,
				bg = palette.lotusWhite0,
				fg_border = palette.lotusGray2,
				bg_border = "none",
			},
		},
		accent = {
			accent1 = palette.lotusBlue3,
			accent2 = palette.lotusOrange,
			accent3 = palette.waveAqua1,
			accent4 = palette.lotusGray3,
			accent5 = palette.lotusRed,
		},
		rainbow = {
			rainbow1 = palette.lotusRed,
			rainbow2 = palette.lotusYellow,
			rainbow3 = palette.lotusBlue4,
			rainbow4 = palette.lotusOrange2,
			rainbow5 = palette.lotusGreen,
			rainbow6 = palette.lotusAqua,
			rainbow7 = palette.lotusTeal2,
		},
		syn = {
			string = palette.lotusGreen,
			variable = "none",
			member = palette.lotusGray2,
			number = palette.lotusPink,
			constant = palette.lotusOrange,
			identifier = palette.lotusYellow,
			parameter = palette.lotusBlue5,
			attribute = palette.lotusYellow,
			fun = palette.lotusBlue4,
			statement = palette.lotusViolet4,
			keyword = palette.lotusViolet4,
			operator = palette.lotusYellow2,
			preproc = palette.lotusRed,
			type = palette.lotusAqua,
			regex = palette.lotusYellow2,
			deprecated = palette.lotusGray3,
			punct = palette.lotusTeal1,
			comment = palette.lotusGray3,
			special1 = palette.lotusTeal2,
			special2 = palette.lotusRed,
			special3 = palette.lotusBlue1,
		},
		vcs = {
			added = palette.lotusGreen2,
			addedDark = palette.autumnGreen,
			removed = palette.lotusRed2,
			removedDark = palette.autumnRed,
			changed = palette.lotusYellow3,
			changedDark = palette.autumnYellow,
		},
		diff = {
			add = palette.lotusGreen3,
			addDark = palette.autumnGreen,
			delete = palette.lotusRed4,
			deleteDark = palette.autumnRed,
			change = palette.lotusCyan,
			changeDark = palette.autumnYellow,
			text = palette.lotusYellow4,
			textDark = palette.waveAqua1,
		},
		diag = {
			error = palette.lotusRed3,
			ok = palette.lotusGreen,
			warning = palette.lotusOrange2,
			info = palette.lotusTeal3,
			hint = palette.lotusAqua2,
		},
		term = {
			palette.lotusInk0, -- black
			palette.lotusRed, -- red
			palette.lotusGreen, -- green
			palette.lotusYellow, -- yellow
			palette.lotusBlue4, -- blue
			palette.lotusPink, -- magenta
			palette.lotusAqua, -- cyan
			palette.lotusInk1, -- white
			palette.lotusGray3, -- bright black
			palette.lotusRed2, -- bright red
			palette.lotusGreen2, -- bright green
			palette.lotusYellow2, -- bright yellow
			palette.lotusTeal2, -- bright blue
			palette.lotusViolet4, -- bright magenta
			palette.lotusAqua2, -- bright cyan
			palette.lotusInk2, -- bright white
			palette.lotusOrange2, -- extended color 1
			palette.lotusRed3, -- extended color 2
		},
	}
end
return M
