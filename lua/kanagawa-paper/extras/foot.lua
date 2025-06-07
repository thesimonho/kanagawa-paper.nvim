local util = require("kanagawa-paper.lib.util")

local M = {}

--- @param colors ThemeColors
function M.generate(colors)
	local foot = util.template(
		[[
# -----------------------------------------------------------------------------
# ${_style_name}
# Upstream: ${_upstream_url}
# URL: ${_url}
# -----------------------------------------------------------------------------
[cursor]
color = ${modes.insert} ${modes.normal}

[colors]
background = ${ui.bg}
foreground = ${ui.fg}
selection-background = ${ui.bg_visual}
selection-foreground = ${ui.fg_gray}
urls = ${syn.special3}

search-box-no-match = ${term.black_bright} ${term.red_bright}
search-box-match = ${term.blue_bright} ${term.black_bright}

jump-labels = ${modes.normal} ${yellow_bright}

# Normal colors
color0 = ${term.black}
color1 = ${term.red}
color2 = ${term.green}
color3 = ${term.yellow}
color4 = ${term.blue}
color5 = ${term.magenta}
color6 = ${term.cyan}
color7 = ${term.white}

# Bright colors
color8 = ${term.black_bright}
color9 = ${term.red_bright}
color10 = ${term.green_bright}
color11 = ${term.yellow_bright}
color12 = ${term.blue_bright}
color13 = ${term.magenta_bright}
color14 = ${term.cyan_bright}
color15 = ${term.white_bright}

# Extended colors
16 = ${term.indexed1}
17 = ${term.indexed2}
]],
		colors
	)

	foot = foot:gsub("#(%x%x%x%x%x%x)", "%1")
	return foot
end

return M
