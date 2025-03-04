local util = require("kanagawa-paper.lib.util")

---@type PaletteColors
local palette = {
	-- Bg Shades
	sumiInkn1 = "#0f0f15",
	sumiInk0 = "#16161D",
	sumiInk1 = "#181820",
	sumiInk2 = "#1a1a22",
	sumiInk3 = "#1F1F28",
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

	dragonBlack0 = "#0d0c0c",
	dragonBlack1 = "#12120f",
	dragonBlack2 = "#1D1C19",
	dragonBlack3 = "#181616",
	dragonBlack4 = "#282727",
	dragonBlack5 = "#393836",
	dragonBlack6 = "#625e5a",

	dragonWhite = "#c5c9c5",
	dragonGreen = "#699469",
	dragonGreen2 = "#8a9a7b",
	dragonPink = "#a292a3",
	dragonOrange = "#b6927b",
	dragonOrange2 = "#b98d7b",
	dragonGray = "#a6a69c",
	dragonGray2 = "#9e9b93",
	dragonGray3 = "#7a8382",
	dragonBlue2 = "#859fac",
	dragonBlue3 = "#708e9e",
	dragonBlue4 = "#5d7a88",
	dragonBlue5 = "#435965",
	dragonViolet = "#8992a7",
	dragonRed = "#c4746e",
	dragonAqua = "#8ea49e",
	dragonAsh = "#737c73",
	dragonTeal = "#949fb5",
	dragonYellow = "#c4b28a",

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

	canvasAqua = "#57786c",
	canvasAqua2 = "#5f847c",
	canvasBlue1 = "#93b5d0",
	canvasBlue2 = "#719ac2",
	canvasBlue3 = "#5c71a4",
	canvasBlue4 = "#526994",
	canvasBlue5 = "#515797",
	canvasCyan = "#56a06a",
	canvasGray0 = "#504f48",
	canvasGray1 = "#858479",
	canvasGray2 = "#a9a8a0",
	canvasGray3 = "#b5b5ae",
	canvasGray4 = "#c1c1bb",
	canvasGreen = "#738859",
	canvasGreen2 = "#709062",
	canvasGreen3 = "#a0c991",
	canvasInk0 = "#3e3e5a",
	canvasInk1 = "#54546b",
	canvasInk2 = "#444466",
	canvasOrange = "#b8805e",
	canvasOrange2 = "#d59260",
	canvasPink = "#a85b76",
	canvasRed = "#ba4e5a",
	canvasRed2 = "#c95556",
	canvasRed3 = "#cd4a4a",
	canvasRed4 = "#daa594",
	canvasTeal1 = "#5f8a9b",
	canvasTeal2 = "#618bb6",
	canvasTeal3 = "#526c79",
	canvasViolet1 = "#c4cbdc",
	canvasViolet2 = "#a398bf",
	canvasViolet3 = "#7967a2",
	canvasViolet4 = "#6f4f9d",
	canvasWhite0 = "#cbc8bc",
	canvasWhite1 = "#d3d0c3",
	canvasWhite2 = "#d8d8d2",
	canvasWhite3 = "#e1e1de", -- main bg
	canvasWhite4 = "#e6e6e3",
	canvasWhite5 = "#ecece8",
	canvasYellow = "#a67337",
	canvasYellow2 = "#c08a48",
	canvasYellow3 = "#d3a56b",
	canvasYellow4 = "#e0be6d",
}

local M = {}
---@param opts? KanagawaConfig
---@return KanagawaColors
function M.setup(opts)
	opts = require("kanagawa-paper.config").extend(opts)

	-- Add to and/or override palette_colors
	local updated_palette_colors = vim.tbl_extend("force", palette, opts.colors.palette or {})

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

return M
