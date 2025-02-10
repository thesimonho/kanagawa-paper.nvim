
---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field member ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field attribute ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field preproc ColorSpec
---@field type ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field comment ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec
---@field special2 ColorSpec
---@field special3 ColorSpec

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec
--
---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec
---@field addDark ColorSpec
---@field deleteDark ColorSpec
---@field changeDark ColorSpec
---@field textDark ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec
---@field addedDark ColorSpec
---@field removedDark ColorSpec
---@field changedDark ColorSpec

---@class ModeElements
---@field normal ColorSpec
---@field insert ColorSpec
---@field visual ColorSpec
---@field replace ColorSpec
---@field command ColorSpec

---@class UiElements
---@field fg ColorSpec Default foreground
---@field fg_gray ColorSpec Slightly darker, offwhite
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_dark ColorSpec Dark foreground text
---@field fg_reverse ColorSpec
---@field bg_dim ColorSpec Dimmed background
---@field bg_m4 ColorSpec Darkest background
---@field bg_m3 ColorSpec Darker background
---@field bg_m2 ColorSpec
---@field bg_m1 ColorSpec Darkest background
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background ColorColumn, Folded, Gutter
---@field bg_p2 ColorSpec Lighter background Cursor{Line,Column}, TabLineSel (Selected Items)
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field bg_search ColorSpec
---@field bg_cursorline ColorSpec
---@field bg_visual ColorSpec
---@field bg_statusline ColorSpec
---@field special ColorSpec SpecialKey
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field win_separator ColorSpec
---@field indent ColorSpec Indent line character
---@field indent_scope ColorSpec Indent scope character
---@field picker ColorSpec Color of picker letters e.g. bufferline pick buffer
---@field scrollbar ColorSpec Color of scrollbar
---@field tabline TabElements
---@field pmenu MenuElements
---@field float FloatElements

---@class TabElements
---@field bg ColorSpec
---@field fg_selected ColorSpec
---@field bg_selected ColorSpec
---@field fg_inactive ColorSpec
---@field bg_inactive ColorSpec

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class RainbowColors
---@field rainbow1 ColorSpec
---@field rainbow2 ColorSpec
---@field rainbow3 ColorSpec
---@field rainbow4 ColorSpec
---@field rainbow5 ColorSpec
---@field rainbow6 ColorSpec
---@field rainbow7 ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field modes ModeElements
---@field rainbow RainbowColors
---@field term ColorSpec[]

---@param palette PaletteColors
---@return ThemeColors
return function(palette)
	local gutter_bg = require("kanagawa-paper.config").options.gutter and palette.sumiInk4 or "none"

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
			bg_p1 = palette.sumiInk4,
			bg_p2 = palette.sumiInk5,
			bg_dim = palette.sumiInk1,
			bg_gutter = gutter_bg,
			bg_search = palette.springViolet1,
			bg_cursorline = palette.sumiInk5,
			bg_visual = palette.lotusInk0,
			bg_statusline = palette.sumiInk4,
			special = palette.springViolet1,
			nontext = palette.sumiInk6,
			whitespace = palette.sumiInk6,
			win_separator = palette.dragonViolet,
			indent = palette.sumiInk5,
			indent_scope = palette.dragonViolet,
			picker = palette.dragonRed,
			scrollbar = palette.fujiGray,
			tabline = {
				bg = palette.sumiInk0,
				fg_selected = palette.sumiInk3,
				bg_selected = palette.dragonYellow,
				fg_inactive = palette.fujiGray,
				bg_inactive = palette.sumiInk4,
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
			string = palette.dragonGreen2,
			variable = "none",
			member = palette.fujiWhite,
			number = palette.dragonPink,
			constant = palette.dragonOrange,
			identifier = palette.dragonYellow,
			parameter = palette.dragonGray,
			attribute = palette.dragonYellow,
			fun = palette.dragonBlue2,
			statement = palette.dragonViolet,
			keyword = palette.dragonPink,
			operator = palette.dragonRed,
			preproc = palette.dragonRed,
			type = palette.dragonAqua,
			regex = palette.dragonRed,
			deprecated = palette.katanaGray,
			punct = palette.dragonGray2,
			comment = palette.fujiGray,
			special1 = palette.dragonTeal,
			special2 = palette.dragonRed,
			special3 = palette.dragonBlue,
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
