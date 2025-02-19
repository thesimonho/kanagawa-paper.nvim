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
			fg = palette.fujiWhite,
			fg_gray = palette.fujiGray,
			fg_dark = palette.dragonBlack3,
			fg_dim = palette.dragonBlack5,
			fg_reverse = palette.waveBlue1,
			bg_m4 = palette.sumiInkn1,
			bg_m3 = palette.sumiInk0,
			bg_m2 = palette.sumiInk1,
			bg_m1 = palette.sumiInk2,
			bg = palette.sumiInk3,
			bg_dim = palette.sumiInk1,
			bg_p1 = palette.sumiInk4,
			bg_p2 = palette.sumiInk5,
			bg_gutter = opts.gutter and palette.sumiInk4 or "none",
			bg_search = palette.springViolet1,
			bg_cursorline = palette.sumiInk5,
			bg_visual = palette.lotusInk0,
			bg_statusline = palette.sumiInk4,
			header1 = palette.dragonViolet,
			header2 = palette.dragonOrange,
			special = palette.springViolet1,
			nontext = palette.sumiInk6,
			whitespace = palette.sumiInk6,
			win_separator = palette.dragonViolet,
			indent = palette.sumiInk5,
			indent_scope = palette.dragonViolet,
			picker = palette.dragonRed,
			mark = palette.waveAqua2,
			scrollbar = palette.fujiGray,
			tabline = {
				bg = palette.sumiInk0,
				fg_selected = palette.dragonWhite,
				bg_selected = palette.sumiInk3,
				fg_inactive = palette.dragonBlack5,
				bg_inactive = palette.sumiInk0,
				fg_alternate = palette.dragonPink,
				bg_alternate = palette.sumiInk0,
				indicator = palette.dragonBlue,
			},
			pmenu = {
				fg = palette.fujiWhite,
				fg_sel = "none", -- This is important to make highlights pass-through
				bg = palette.sumiInk4,
				bg_sel = palette.sumiInk6,
				bg_sbar = palette.sumiInk5,
				bg_thumb = palette.sumiInk6,
			},
			float = {
				fg = palette.oldWhite,
				bg = palette.sumiInk4,
				fg_border = palette.sumiInk6,
				bg_border = "none",
			},
		},
		accent = {
			accent1 = palette.dragonBlue,
			accent2 = palette.dragonOrange,
			accent3 = palette.waveAqua1,
			accent4 = palette.dragonGray3,
			accent5 = palette.dragonRed,
		},
		rainbow = {
			rainbow1 = palette.dragonRed,
			rainbow2 = palette.dragonYellow,
			rainbow3 = palette.dragonBlue,
			rainbow4 = palette.dragonOrange2,
			rainbow5 = palette.dragonGreen,
			rainbow6 = palette.dragonAsh,
			rainbow7 = palette.dragonTeal,
		},
		syn = {
			attribute = palette.dragonYellow,
			comment = palette.fujiGray,
			constant = palette.dragonOrange,
			deprecated = palette.katanaGray,
			fun = palette.dragonBlue2,
			identifier = palette.dragonYellow,
			keyword = palette.dragonPink,
			member = palette.fujiWhite,
			number = palette.dragonPink,
			operator = palette.dragonRed,
			parameter = palette.dragonGray,
			preproc = palette.dragonRed,
			punct = palette.dragonGray2,
			regex = palette.dragonRed,
			statement = palette.dragonViolet,
			string = palette.dragonGreen2,
			symbol = palette.dragonRed,
			type = palette.dragonAqua,
			variable = "none",
			special1 = palette.dragonYellow,
			special2 = palette.dragonRed,
			special3 = palette.springViolet1,
		},
		vcs = {
			added = palette.autumnGreen,
			addedDark = palette.winterGreen,
			removed = palette.autumnRed,
			removedDark = palette.winterRed,
			changed = palette.autumnYellow,
			changedDark = palette.winterYellow,
		},
		diff = {
			add = palette.autumnGreen,
			addDark = palette.winterGreen,
			delete = palette.autumnRed,
			deleteDark = palette.winterRed,
			change = palette.dragonYellow,
			changeDark = palette.winterYellow,
			text = palette.dragonBlue,
			textDark = palette.winterBlue,
		},
		diag = {
			error = palette.samuraiRed,
			ok = palette.springGreen,
			warning = palette.roninYellow,
			info = palette.dragonBlue,
			hint = palette.waveAqua1,
		},
		term = {
			palette.dragonBlack0, -- black
			palette.dragonRed, -- red
			palette.dragonGreen2, -- green
			palette.dragonYellow, -- yellow
			palette.dragonBlue2, -- blue
			palette.dragonPink, -- magenta
			palette.dragonAqua, -- cyan
			palette.oldWhite, -- white
			palette.dragonGray, -- bright black
			palette.waveRed, -- bright red
			palette.dragonGreen, -- bright green
			palette.carpYellow, -- bright yellow
			palette.springBlue, -- bright blue
			palette.springViolet1, -- bright magenta
			palette.waveAqua2, -- bright cyan
			palette.dragonWhite, -- bright white
			palette.dragonOrange, -- extended color 1
			palette.dragonOrange2, -- extended color 2
		},
	}
end
return M
