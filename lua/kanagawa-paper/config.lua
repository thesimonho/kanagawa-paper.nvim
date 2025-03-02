local M = {}

M.defaults = {
	theme = "ink", -- one of "ink" or "canvas"

	-- features and appearance
	undercurl = true,
	transparent = false,
	gutter = false,
	diagBackground = true, -- background for diagnostic virtual text
	dimInactive = true, -- disabled when transparent
	terminalColors = true,
	brightnessOffset = 0, -- adjust brightness of the theme [-1, 1]
	saturationOffset = 0, -- adjust saturation of the theme [-1, 1]

	-- style options
	commentStyle = { italic = true },
	functionStyle = { italic = false },
	keywordStyle = { italic = false, bold = false },
	statementStyle = { italic = false, bold = false },
	typeStyle = { italic = false },

	-- color overrides
	colors = { palette = {}, theme = { ink = {}, canvas = {} } }, -- override default palette and theme colors
	---@type fun(colors: KanagawaColors): table<string, vim.api.keyset.highlight>
	overrides = function() -- override highlight groups
		return {}
	end,

	-- enable/disable plugins
	auto_plugins = true, -- uses lazy.nvim, if installed, to automatically enable needed plugins
	all_plugins = package.loaded.lazy == nil, -- enable highlights for all plugins (disabled if using lazy.nvim)
	plugins = {
		-- manually enable/disable individual plugins
		-- check the `groups/plugins` directory for the exact names
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
