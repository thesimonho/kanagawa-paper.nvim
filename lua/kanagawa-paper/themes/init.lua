local color = require("kanagawa-paper.lib.color")
local util = require("kanagawa-paper.lib.util")

---@param hex ColorSpec
---@param offset number
---@return ColorSpec
local function apply_brightness(hex, offset)
	local clamped_offset = util.clamp(offset, -1, 1)
	local rescaled_offset = util.scale_log(clamped_offset, 3, 0.2)
	return color(hex):brighten(rescaled_offset):to_hex()
end

---@param hex ColorSpec
---@param offset number
---@return ColorSpec
local function apply_saturation(hex, offset)
	local clamped_offset = util.clamp(offset, -1, 1)
	local rescaled_offset = util.scale_log_asymmetric(clamped_offset, 3, 0.2, 0.5)
	return color(hex):saturate(rescaled_offset):to_hex()
end

local M = {}

---@param opts? KanagawaConfig
function M.setup(opts)
	opts = require("kanagawa-paper.config").extend(opts)

	local colors = require("kanagawa-paper.colors").setup(opts)
	local groups, _ = require("kanagawa-paper.groups").setup(colors, opts)

	-- only needed to clear when not the default colorscheme
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "kanagawa-paper-" .. opts.theme

	for hl, spec in pairs(groups) do
		spec = type(spec) == "string" and { link = spec } or spec
		for _, field in ipairs({ "bg", "fg", "sp" }) do
			if spec[field] then
				if opts.colorBalance[opts.theme].saturation ~= 0 then
					spec[field] = apply_saturation(spec[field], opts.colorBalance[opts.theme].saturation)
				end
				if opts.colorBalance[opts.theme].brightness ~= 0 then
					spec[field] = apply_brightness(spec[field], opts.colorBalance[opts.theme].brightness)
				end
			end
		end
		vim.api.nvim_set_hl(0, hl, spec)
	end

	if opts.terminalColors then
		M.terminal(colors, opts)
	end

	return colors, groups, opts
end

---@param colors KanagawaColors
---@param opts KanagawaConfig
function M.terminal(colors, opts)
	for hl, _ in pairs(colors.theme.term) do
		if opts.colorBalance[opts.theme].saturation ~= 0 then
			colors.theme.term[hl] = apply_saturation(colors.theme.term[hl], opts.colorBalance[opts.theme].saturation)
		end
		if opts.colorBalance[opts.theme].brightness ~= 0 then
			colors.theme.term[hl] = apply_brightness(colors.theme.term[hl], opts.colorBalance[opts.theme].brightness)
		end
	end

	-- dark
	vim.g.terminal_color_0 = colors.theme.term.black
	vim.g.terminal_color_8 = colors.theme.term.black_bright

	-- light
	vim.g.terminal_color_7 = colors.theme.term.white
	vim.g.terminal_color_15 = colors.theme.term.white_bright

	-- colors
	vim.g.terminal_color_1 = colors.theme.term.red
	vim.g.terminal_color_9 = colors.theme.term.red_bright

	vim.g.terminal_color_2 = colors.theme.term.green
	vim.g.terminal_color_10 = colors.theme.term.green_bright

	vim.g.terminal_color_3 = colors.theme.term.yellow
	vim.g.terminal_color_11 = colors.theme.term.yellow_bright

	vim.g.terminal_color_4 = colors.theme.term.blue
	vim.g.terminal_color_12 = colors.theme.term.blue_bright

	vim.g.terminal_color_5 = colors.theme.term.magenta
	vim.g.terminal_color_13 = colors.theme.term.magenta_bright

	vim.g.terminal_color_6 = colors.theme.term.cyan
	vim.g.terminal_color_14 = colors.theme.term.cyan_bright

	-- indexed
	vim.g.terminal_color_16 = colors.theme.term.indexed1
	vim.g.terminal_color_17 = colors.theme.term.indexed2
end

return M
