---@class KanagawaGroups
---@field [string] vim.api.keyset.highlight

local color = require("kanagawa-paper.lib.color")
local util = require("kanagawa-paper.lib.util")
local M = {}

---@param hex ColorSpec
---@param offset number
---@return ColorSpec
local function apply_brightness(hex, offset)
	if offset == 0 then
		return hex
	end
	local clamped_offset = util.clamp(offset, -1, 1)
	local rescaled_offset = util.scale_log(clamped_offset, 3, 0.2)
	return color(hex):brighten(rescaled_offset):to_hex()
end

---@param hex ColorSpec
---@param offset number
---@return ColorSpec
local function apply_saturation(hex, offset)
	if offset == 0 then
		return hex
	end
	local clamped_offset = util.clamp(offset, -1, 1)
	local rescaled_offset = util.scale_log_asymmetric(clamped_offset, 3, 0.2, 0.5)
	return color(hex):saturate(rescaled_offset):to_hex()
end

---@param groups KanagawaGroups
---@param colors KanagawaColors
---@param config { defaults?: KanagawaConfig, options: KanagawaConfig }
function M.highlight(groups, colors, config)
	for hl, spec in pairs(groups) do
		for _, field in ipairs({ "bg", "fg", "sp" }) do
			if spec[field] then
				spec[field] = apply_saturation(spec[field], config.options.saturationOffset)
				spec[field] = apply_brightness(spec[field], config.options.brightnessOffset)
			end
		end
		vim.api.nvim_set_hl(0, hl, spec)
	end

	if config.options.terminalColors and next(colors.theme.term) then
		local ordered_keys = {
			"black",
			"red",
			"green",
			"yellow",
			"blue",
			"magenta",
			"cyan",
			"white",
			"black_bright",
			"red_bright",
			"green_bright",
			"yellow_bright",
			"blue_bright",
			"magenta_bright",
			"cyan_bright",
			"white_bright",
			"indexed1",
			"indexed2",
		}
		for i, key in ipairs(ordered_keys) do
			vim.g["terminal_color_" .. (i - 1)] = function()
				local c = colors.theme.term[key]
				c = apply_saturation(c, config.options.saturationOffset)
				c = apply_brightness(c, config.options.brightnessOffset)
				return c
			end
		end
	end
end

---@param colors KanagawaColors
---@param opts? KanagawaConfig
---@return KanagawaGroups
function M.setup(colors, opts)
	opts = opts or require("kanagawa-paper.config").options

	---@type KanagawaGroups
	local groups = {}

	-- add base groups
	for _, group in ipairs({ "editor", "syntax", "treesitter", "lsp", "ft" }) do
		local mod = require("kanagawa-paper.groups." .. group)
		for hl, spec in pairs(mod.setup(colors, opts)) do
			groups[hl] = spec
		end
	end

	-- determine plugin groups based on user config
	local enabled_plugins = {}
	if opts.all_plugins then
		local plugin_dir = vim.api.nvim_get_runtime_file("**/kanagawa-paper/groups/plugins", false)
		if #plugin_dir > 0 then
			local plugin_root = plugin_dir[1]
			local scan = vim.uv.fs_scandir(plugin_root)
			if scan then
				while true do
					local name, type = vim.uv.fs_scandir_next(scan)
					if not name then
						break
					end
					-- each plugin spec is assumed to be a lua file
					if type == "file" then
						local basename = vim.fn.fnamemodify(name, ":t:r")
						enabled_plugins[basename] = true
					end
				end
			end
		end
	end
	enabled_plugins = vim.tbl_extend("force", enabled_plugins, opts.plugins)

	-- add groups
	for plugin, enabled in pairs(enabled_plugins) do
		if enabled then
			-- use pcall to avoid error if plugin doesnt exist
			local ok, res = pcall(require, "kanagawa-paper.groups.plugins." .. plugin)
			if not ok then
				vim.notify("Error loading theme plugin: " .. plugin .. "\n" .. res, vim.log.levels.ERROR)
			else
				for hl, spec in pairs(res.get(colors, opts)) do
					groups[hl] = spec
				end
			end
		end
	end

	-- apply user overrides
	for hl, spec in pairs(opts.overrides(colors)) do
		if groups[hl] and next(spec) then
			groups[hl].link = nil
		end
		groups[hl] = vim.tbl_extend("force", groups[hl] or {}, spec)
	end

	return groups
end

return M
