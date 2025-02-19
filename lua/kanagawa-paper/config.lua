---@alias ColorSpec string RGB Hex string
---@alias ColorTable table<string, ColorSpec>
---@alias KanagawaColorsSpec { palette: ColorTable, theme: ColorTable }
---@alias KanagawaColors { palette: PaletteColors, theme: ThemeColors }

local M = {}

---@class KanagawaConfig
M.defaults = {
	theme = "ink",
	undercurl = true,
	transparent = false,
	gutter = false,
	dimInactive = true, -- disabled when transparent
	terminalColors = true,
	commentStyle = { italic = true },
	functionStyle = { italic = false },
	keywordStyle = { italic = false, bold = false },
	statementStyle = { italic = false, bold = false },
	typeStyle = { italic = false },
	colors = { theme = {}, palette = {} },
	---@type fun(colors: KanagawaColorsSpec): table<string, table>
	overrides = function()
		return {}
	end,
	all_plugins = true, -- enable highlights for all the plugins
	plugins = {
		-- manually enable/disable individual plugins
		-- check the groups/plugins directory for the exact names
		-- examples:
		-- rainbow_delimiters = true
		-- which_key = false
	},
}

---@type KanagawaConfig
M.options = nil

---@param options? KanagawaConfig user configuration
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param options? KanagawaConfig user configuration
function M.extend(options)
	M.options = vim.tbl_deep_extend("force", {}, M.options, options or {})
	return M.options
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.options or M.defaults
		end
	end,
})

M.setup()

return M
