---@alias ColorSpec string RGB Hex string

---@class KanagawaConfig
---@field _theme? "auto" | "ink" | "canvas"
---@field undercurl? boolean
---@field transparent? boolean
---@field gutter? boolean
---@field diagBackground? boolean
---@field dimInactive? boolean
---@field terminalColors? boolean
---@field commentStyle? vim.api.keyset.highlight
---@field functionStyle? vim.api.keyset.highlight
---@field keywordStyle? vim.api.keyset.highlight
---@field statementStyle? vim.api.keyset.highlight
---@field typeStyle? vim.api.keyset.highlight
---@field colors? {palette: PaletteColors, theme: {ink: ThemeColors, canvas: ThemeColors}}
---@field colorBalance? table<string, ColorOffset>
---@field overrides? fun(colors: KanagawaColors): table<string, vim.api.keyset.highlight>
---@field all_plugins? boolean
---@field auto_plugins? boolean
---@field plugins? table<string, boolean>

---@class ColorOffset
---@field brightness number [-1, 1]
---@field saturation number [-1, 1]

---@class KanagawaGroups
---@field [string] vim.api.keyset.highlight

---@class KanagawaColors
---@field palette? PaletteColors
---@field theme ThemeColors

---@class PaletteColors
---@field sumiInkn1? ColorSpec
---@field sumiInk0? ColorSpec
---@field sumiInk1? ColorSpec
---@field sumiInk2? ColorSpec
---@field sumiInk3? ColorSpec
---@field sumiInk4? ColorSpec
---@field sumiInk5? ColorSpec
---@field sumiInk6? ColorSpec
---@field waveAqua1? ColorSpec
---@field waveAqua2? ColorSpec
---@field waveBlue1? ColorSpec
---@field waveBlue2? ColorSpec
---@field waveRed? ColorSpec
---@field winterGreen? ColorSpec
---@field winterYellow? ColorSpec
---@field winterRed? ColorSpec
---@field winterBlue? ColorSpec
---@field autumnGreen? ColorSpec
---@field autumnRed? ColorSpec
---@field autumnYellow? ColorSpec
---@field samuraiRed? ColorSpec
---@field roninYellow? ColorSpec
---@field oldWhite? ColorSpec
---@field fujiWhite? ColorSpec
---@field fujiGray? ColorSpec
---@field oniViolet? ColorSpec
---@field oniViolet2? ColorSpec
---@field springGreen? ColorSpec
---@field springViolet1? ColorSpec
---@field springViolet2? ColorSpec
---@field springBlue? ColorSpec
---@field crystalBlue? ColorSpec
---@field lightBlue? ColorSpec
---@field boatYellow1? ColorSpec
---@field boatYellow2? ColorSpec
---@field carpYellow? ColorSpec
---@field sakuraPink? ColorSpec
---@field peachRed? ColorSpec
---@field surimiOrange? ColorSpec
---@field katanaGray? ColorSpec
---@field dragonBlack0? ColorSpec
---@field dragonBlack1? ColorSpec
---@field dragonBlack2? ColorSpec
---@field dragonBlack3? ColorSpec
---@field dragonBlack4? ColorSpec
---@field dragonBlack5? ColorSpec
---@field dragonBlack6? ColorSpec
---@field dragonBlue? ColorSpec
---@field dragonWhite? ColorSpec
---@field dragonGreen? ColorSpec
---@field dragonGreen2? ColorSpec
---@field dragonPink? ColorSpec
---@field dragonOrange? ColorSpec
---@field dragonOrange2? ColorSpec
---@field dragonGray? ColorSpec
---@field dragonGray2? ColorSpec
---@field dragonGray3? ColorSpec
---@field dragonBlue2? ColorSpec
---@field dragonBlue3? ColorSpec
---@field dragonBlue4? ColorSpec
---@field dragonBlue5? ColorSpec
---@field dragonViolet? ColorSpec
---@field dragonRed? ColorSpec
---@field dragonAqua? ColorSpec
---@field dragonAsh? ColorSpec
---@field dragonTeal? ColorSpec
---@field dragonYellow? ColorSpec
---@field lotusInk0? ColorSpec
---@field lotusInk1? ColorSpec
---@field lotusInk2? ColorSpec
---@field lotusGray? ColorSpec
---@field lotusGray2? ColorSpec
---@field lotusGray3? ColorSpec
---@field lotusWhite0? ColorSpec
---@field lotusWhite1? ColorSpec
---@field lotusWhite2? ColorSpec
---@field lotusWhite3? ColorSpec
---@field lotusWhite4? ColorSpec
---@field lotusWhite5? ColorSpec
---@field lotusViolet1? ColorSpec
---@field lotusViolet2? ColorSpec
---@field lotusViolet3? ColorSpec
---@field lotusViolet4? ColorSpec
---@field lotusBlue1? ColorSpec
---@field lotusBlue2? ColorSpec
---@field lotusBlue3? ColorSpec
---@field lotusBlue4? ColorSpec
---@field lotusBlue5? ColorSpec
---@field lotusGreen? ColorSpec
---@field lotusGreen2? ColorSpec
---@field lotusGreen3? ColorSpec
---@field lotusPink? ColorSpec
---@field lotusOrange? ColorSpec
---@field lotusOrange2? ColorSpec
---@field lotusYellow? ColorSpec
---@field lotusYellow2? ColorSpec
---@field lotusYellow3? ColorSpec
---@field lotusYellow4? ColorSpec
---@field lotusRed? ColorSpec
---@field lotusRed2? ColorSpec
---@field lotusRed3? ColorSpec
---@field lotusRed4? ColorSpec
---@field lotusAqua? ColorSpec
---@field lotusAqua2? ColorSpec
---@field lotusTeal1? ColorSpec
---@field lotusTeal2? ColorSpec
---@field lotusTeal3? ColorSpec
---@field lotusCyan? ColorSpec
---@field canvasAqua? ColorSpec
---@field canvasAqua2? ColorSpec
---@field canvasBlue1? ColorSpec
---@field canvasBlue2? ColorSpec
---@field canvasBlue3? ColorSpec
---@field canvasBlue4? ColorSpec
---@field canvasBlue5? ColorSpec
---@field canvasCyan? ColorSpec
---@field canvasGray0? ColorSpec
---@field canvasGray1? ColorSpec
---@field canvasGray2? ColorSpec
---@field canvasGray3? ColorSpec
---@field canvasGray4? ColorSpec
---@field canvasGreen? ColorSpec
---@field canvasGreen2? ColorSpec
---@field canvasGreen3? ColorSpec
---@field canvasInk0? ColorSpec
---@field canvasInk1? ColorSpec
---@field canvasInk2? ColorSpec
---@field canvasOrange? ColorSpec
---@field canvasOrange2? ColorSpec
---@field canvasPink? ColorSpec
---@field canvasRed? ColorSpec
---@field canvasRed2? ColorSpec
---@field canvasRed3? ColorSpec
---@field canvasRed4? ColorSpec
---@field canvasTeal1? ColorSpec
---@field canvasTeal2? ColorSpec
---@field canvasTeal3? ColorSpec
---@field canvasViolet1? ColorSpec
---@field canvasViolet2? ColorSpec
---@field canvasViolet3? ColorSpec
---@field canvasViolet4? ColorSpec
---@field canvasWhite0? ColorSpec
---@field canvasWhite1? ColorSpec
---@field canvasWhite2? ColorSpec
---@field canvasWhite3? ColorSpec
---@field canvasWhite4? ColorSpec
---@field canvasWhite5? ColorSpec
---@field canvasYellow? ColorSpec
---@field canvasYellow2? ColorSpec
---@field canvasYellow3? ColorSpec
---@field canvasYellow4? ColorSpec

---@class ThemeColors
---@field syn? SyntaxElements
---@field diag? DiagnosticsElements
---@field vcs? VCSElements
---@field diff? DiffElements
---@field ui? UIElements
---@field modes? ModeElements
---@field rainbow? RainbowColors
---@field accent? AccentColors
---@field term? TermColors

---@class SyntaxElements
---@field string ColorSpec
---@field symbol ColorSpec
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
---@field error_light ColorSpec
---@field ok_light ColorSpec
---@field warning_light ColorSpec
---@field info_light ColorSpec
---@field hint_light ColorSpec
--
---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec
---@field add_light ColorSpec
---@field delete_light ColorSpec
---@field change_light ColorSpec
---@field text_light ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec
---@field added_light ColorSpec
---@field removed_light ColorSpec
---@field changed_light ColorSpec

---@class ModeElements
---@field normal ColorSpec
---@field insert ColorSpec
---@field visual ColorSpec
---@field replace ColorSpec
---@field command ColorSpec

---@class UIElements
---@field fg ColorSpec Default foreground
---@field fg_gray ColorSpec Slightly darker, offwhite
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_dark ColorSpec Dark foreground text
---@field fg_reverse ColorSpec Reversed foreground text
---@field bg_dim ColorSpec Dimmed background
---@field bg_m4 ColorSpec Darkest background
---@field bg_m3 ColorSpec Darker background
---@field bg_m2 ColorSpec
---@field bg_m1 ColorSpec Dark background
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background ColorColumn, Folded, Gutter
---@field bg_p2 ColorSpec Lighter background Cursor{Line,Column}, TabLineSel (Selected Items)
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field bg_search ColorSpec Search background
---@field bg_cursorline ColorSpec CursorLine background
---@field bg_visual ColorSpec Visual selection background
---@field bg_statusline ColorSpec Statusline background
---@field border ColorSpec Border color
---@field header1 ColorSpec Header1 text
---@field header2 ColorSpec Header2 text
---@field special ColorSpec SpecialKey
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field win_separator ColorSpec Separator for dividers
---@field indent ColorSpec Indent line character
---@field indent_scope ColorSpec Indent scope character
---@field picker ColorSpec Color of picker letters e.g. bufferline pick buffer
---@field mark ColorSpec Color of mark indicators
---@field scrollbar ColorSpec Color of scrollbar
---@field tabline TabElements Tabline colors
---@field pmenu MenuElements
---@field float FloatElements

---@class TabElements
---@field bg ColorSpec
---@field fg_selected ColorSpec
---@field bg_selected ColorSpec
---@field fg_inactive ColorSpec
---@field bg_inactive ColorSpec
---@field fg_alternate ColorSpec
---@field bg_alternate ColorSpec
---@field indicator ColorSpec

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_border ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec
---@field bg_border ColorSpec

---@class RainbowColors
---@field rainbow1 ColorSpec
---@field rainbow2 ColorSpec
---@field rainbow3 ColorSpec
---@field rainbow4 ColorSpec
---@field rainbow5 ColorSpec
---@field rainbow6 ColorSpec
---@field rainbow7 ColorSpec

---@class AccentColors
---@field accent1 ColorSpec
---@field accent2 ColorSpec
---@field accent3 ColorSpec
---@field accent4 ColorSpec
---@field accent5 ColorSpec
---@field invert ColorSpec Highlight color that is a lighter/darker shade of the background

---@class TermColors
---@field black ColorSpec
---@field red ColorSpec
---@field green ColorSpec
---@field yellow ColorSpec
---@field blue ColorSpec
---@field magenta ColorSpec
---@field cyan ColorSpec
---@field white ColorSpec
---@field black_bright ColorSpec
---@field red_bright ColorSpec
---@field green_bright ColorSpec
---@field yellow_bright ColorSpec
---@field blue_bright ColorSpec
---@field magenta_bright ColorSpec
---@field cyan_bright ColorSpec
---@field white_bright ColorSpec
---@field indexed1 ColorSpec
---@field indexed2 ColorSpec
