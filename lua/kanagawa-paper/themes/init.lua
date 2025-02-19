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
---@field header1 ColorSpec
---@field header2 ColorSpec
---@field special ColorSpec SpecialKey
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field win_separator ColorSpec
---@field indent ColorSpec Indent line character
---@field indent_scope ColorSpec Indent scope character
---@field picker ColorSpec Color of picker letters e.g. bufferline pick buffer
---@field mark ColorSpec Color of mark indicators
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

---@class AccentColors
---@field accent1 ColorSpec
---@field accent2 ColorSpec
---@field accent3 ColorSpec
---@field accent4 ColorSpec
---@field accent5 ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field modes ModeElements
---@field rainbow RainbowColors
---@field accent AccentColors
---@field term ColorSpec[]

local M = {}

---@param opts? KanagawaConfig
---@param palette PaletteColors
---@return ThemeColors
function M.setup(opts, palette)
	opts = opts or require("kanagawa-paper.config").options
	return require("kanagawa-paper.themes." .. opts.theme).get(opts, palette)
end

return M
