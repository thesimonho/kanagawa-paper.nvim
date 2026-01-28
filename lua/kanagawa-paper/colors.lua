local color = require("kanagawa-paper.lib.color")
local util = require("kanagawa-paper.lib.util")
local clamp = util.clamp
local scale_log = util.scale_log
local scale_log_asymmetric = util.scale_log_asymmetric

local M = {}

---@param opts? KanagawaConfig
---@return KanagawaColors
function M.setup(opts)
	opts = require("kanagawa-paper.config").extend(opts)

	-- Add to and/or override palette_colors
	local updated_palette_colors = vim.tbl_extend("force", M.palette, opts.colors.palette or {})

	-- Generate the theme according to the updated palette colors
	local current_theme = util.get_current_theme(opts)
	local theme_path = "kanagawa-paper.themes." .. current_theme
	local theme_colors = require(theme_path).get(opts, updated_palette_colors)

	-- Add to and/or override theme_colors
	local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, opts.colors.theme[current_theme] or {})

	-- return palette_colors and theme_colors
	return {
		theme = updated_theme_colors,
		palette = updated_palette_colors,
	}
end

---@param hex ColorSpec
---@param offset number
---@return ColorSpec
function M.apply_brightness(hex, offset)
	local clamped_offset = clamp(offset, -1, 1)
	local rescaled_offset = scale_log(clamped_offset, 3, 0.2)
	return color(hex):brighten(rescaled_offset):to_hex()
end

---@param hex ColorSpec
---@param offset number
---@return ColorSpec
function M.apply_saturation(hex, offset)
	local clamped_offset = clamp(offset, -1, 1)
	local rescaled_offset = scale_log_asymmetric(clamped_offset, 3, 0.2, 0.5)
	return color(hex):saturate(rescaled_offset):to_hex()
end

---@param colors KanagawaColors
---@param opts KanagawaConfig
---@return table<number, ColorSpec>
function M.terminal(colors, opts)
	local current_theme = util.get_current_theme(opts)
	for hl, _ in pairs(colors.theme.term) do
		if opts.color_balance[current_theme].saturation ~= 0 then
			colors.theme.term[hl] =
				M.apply_saturation(colors.theme.term[hl], opts.color_balance[current_theme].saturation)
		end
		if opts.color_balance[current_theme].brightness ~= 0 then
			colors.theme.term[hl] =
				M.apply_brightness(colors.theme.term[hl], opts.color_balance[current_theme].brightness)
		end
	end

	return {
		[0] = colors.theme.term.black,
		[1] = colors.theme.term.red,
		[2] = colors.theme.term.green,
		[3] = colors.theme.term.yellow,
		[4] = colors.theme.term.blue,
		[5] = colors.theme.term.magenta,
		[6] = colors.theme.term.cyan,
		[7] = colors.theme.term.white,
		[8] = colors.theme.term.black_bright,
		[9] = colors.theme.term.red_bright,
		[10] = colors.theme.term.green_bright,
		[11] = colors.theme.term.yellow_bright,
		[12] = colors.theme.term.blue_bright,
		[13] = colors.theme.term.magenta_bright,
		[14] = colors.theme.term.cyan_bright,
		[15] = colors.theme.term.white_bright,
		[16] = colors.theme.term.indexed1,
		[17] = colors.theme.term.indexed2,
	}
end

---@type PaletteColors
M.palette = {
	-- Bg Shades
	sumiInkn1 = "#0f0f15",
	sumiInk0 = "#16161D",
	sumiInk1 = "#181820",
	sumiInk2 = "#1a1a22",
	sumiInk3 = "#1F1F28", -- ink bg
	sumiInk4 = "#2A2A37",
	sumiInk5 = "#363646",
	sumiInk6 = "#54546D",

	-- Popup and Floats
	waveBlue1 = "#223249",
	waveBlue2 = "#2D4F67",

	-- Diff and Git
	winterGreen = "#2B3328",
	winterYellow = "#49443C",
	winterRed = "#43242B",
	winterBlue = "#252535",
	autumnGreen = "#76946A",
	autumnRed = "#C34043",
	autumnYellow = "#DCA561",

	-- Diag
	samuraiRed = "#E82424",
	roninYellow = "#FF9E3B",
	waveAqua1 = "#6A9589",
	dragonBlue = "#658594",

	-- Fg and Comments
	oldWhite = "#C8C093",
	fujiWhite = "#DCD7BA",
	fujiGray = "#727169",

	oniViolet = "#957FB8",
	oniViolet2 = "#b8b4d0",
	springViolet1 = "#938AA9",
	springViolet2 = "#9CABCA",
	springBlue = "#7FB4CA",
	crystalBlue = "#7E9CD8",
	lightBlue = "#A3D4D5",
	waveAqua2 = "#7AA89F",

	springGreen = "#98BB6C",
	boatYellow1 = "#938056",
	boatYellow2 = "#C0A36E",
	carpYellow = "#E6C384",

	sakuraPink = "#D27E99",
	waveRed = "#E46876",
	peachRed = "#FF5D62",
	surimiOrange = "#FFA066",
	katanaGray = "#717C7C",

	dragonAqua = "#8ea49e",
	dragonAsh = "#737c73",
	dragonBlack0 = "#0d0c0c",
	dragonBlack1 = "#12120f",
	dragonBlack2 = "#1D1C19",
	dragonBlack3 = "#181616",
	dragonBlack4 = "#282727",
	dragonBlack5 = "#393836",
	dragonBlack6 = "#625e5a",
	dragonBlue2 = "#859fac",
	dragonBlue3 = "#708e9e",
	dragonBlue4 = "#5d7a88",
	dragonBlue5 = "#435965",
	dragonGray = "#a6a69c",
	dragonGray2 = "#9e9b93",
	dragonGray3 = "#7a8382",
	dragonGreen = "#699469",
	dragonGreen2 = "#8a9a7b",
	dragonGreen3 = "#717e67",
	dragonOrange = "#b6927b",
	dragonOrange2 = "#9d7665",
	dragonPink = "#a292a3",
	dragonRed = "#c4746e",
	dragonTeal = "#949fb5",
	dragonViolet = "#8992a7",
	dragonWhite = "#c5c9c5",
	dragonYellow = "#c4b28a", -- ink primary accent

	canvasAqua1 = "#7b958e",
	canvasAsh1 = "#637263",
	canvasBlue1 = "#809ba7",
	canvasBlue2 = "#6b8998",
	canvasBlue3 = "#577888",
	canvasBlue4 = "#516e7d",
	canvasBlue5 = "#3a515e",
	canvasCyan1 = "#4a905d",
	canvasGray1 = "#aeaea6",
	canvasGray2 = "#8e8a80",
	canvasGray3 = "#73787d",
	canvasGreen1 = "#7e9579",
	canvasGreen2 = "#7a8c6a",
	canvasGreen3 = "#9ba98e",
	canvasOrange1 = "#b28d77",
	canvasOrange2 = "#a8826a",
	canvasPink1 = "#9e7e98",
	canvasPink2 = "#c1b4c1",
	canvasPink3 = "#d4cdd4",
	canvasRed1 = "#c27672",
	canvasTeal1 = "#7e8faf", -- canvas primary accent
	canvasViolet1 = "#7880a5",
	canvasViolet2 = "#9ba1bf",
	canvasYellow1 = "#a7956a",
	canvasYellow2 = "#b4a88a",
	canvasWhite1 = "#cbc8bc",
	canvasWhite2 = "#d1cfc5",
	canvasWhite3 = "#d8d8d2",
	canvasWhite4 = "#e1e1de", -- canvas bg
	canvasWhite5 = "#e6e6e3",
	canvasWhite6 = "#ecece8",

	lotusInk0 = "#3d3d5e",
	lotusInk1 = "#545464",
	lotusInk2 = "#43436c",
	lotusGray = "#dcd7ba",
	lotusGray2 = "#716e61",
	lotusGray3 = "#8a8980",
	lotusWhite0 = "#d5cea3",
	lotusWhite1 = "#dcd5ac",
	lotusWhite2 = "#e5ddb0",
	lotusWhite3 = "#f2ecbc",
	lotusWhite4 = "#e7dba0",
	lotusWhite5 = "#e4d794",
	lotusViolet1 = "#a09cac",
	lotusViolet2 = "#766b90",
	lotusViolet3 = "#c9cbd1",
	lotusViolet4 = "#624c83",
	lotusBlue1 = "#c7d7e0",
	lotusBlue2 = "#b5cbd2",
	lotusBlue3 = "#9fb5c9",
	lotusBlue4 = "#4d699b",
	lotusBlue5 = "#5d57a3",
	lotusGreen = "#6f894e",
	lotusGreen2 = "#6e915f",
	lotusGreen3 = "#b7d0ae",
	lotusPink = "#b35b79",
	lotusOrange = "#cc6d00",
	lotusOrange2 = "#e98a00",
	lotusYellow = "#77713f",
	lotusYellow2 = "#836f4a",
	lotusYellow3 = "#de9800",
	lotusYellow4 = "#f9d791",
	lotusRed = "#c84053",
	lotusRed2 = "#d7474b",
	lotusRed3 = "#e82424",
	lotusRed4 = "#d9a594",
	lotusAqua = "#597b75",
	lotusAqua2 = "#5e857a",
	lotusTeal1 = "#4e8ca2",
	lotusTeal2 = "#6693bf",
	lotusTeal3 = "#5a7785",
	lotusCyan = "#d7e3d8",
}

return M
