local M = {}

---@class KanagawaConfig
M.defaults = {
	-- theme variant to use:
	-- "ink" : dark theme
	-- "canvas" : light theme
	-- "kanagawa-paper" : automatically set theme based on background color
	theme = "kanagawa-paper",

	-- enable undercurls for underlined text
	undercurl = true,
	-- transparent background
	transparent = false,
	-- highlight background for the left gutter
	gutter = false,
	-- background for diagnostic virtual text
	diagBackground = true,
	-- dim inactive windows. disabled when transparent
	dimInactive = true,
	-- set colors for terminal buffers
	terminalColors = true,

	-- style for comments
	commentStyle = { italic = true },
	-- style for functions
	functionStyle = { italic = false },
	-- style for keywords
	keywordStyle = { italic = false, bold = false },
	-- style for statements
	statementStyle = { italic = false, bold = false },
	-- style for types
	typeStyle = { italic = false },

	-- override default palette and theme colors
	colors = {
		palette = {},
		theme = {
			ink = {},
			canvas = {},
		},
	},
	-- adjust overall color balance for each theme [-1, 1]
	colorBalance = {
		ink = { brightness = 0, saturation = 0 },
		canvas = { brightness = 0, saturation = 0 },
	},
	-- override highlight groups
	overrides = function(colors)
		return {}
	end,

	-- uses lazy.nvim, if installed, to automatically enable needed plugins
	auto_plugins = true,
	-- enable highlights for all plugins (disabled if using lazy.nvim)
	all_plugins = package.loaded.lazy == nil,
	-- manually enable/disable individual plugins.
	-- check the `groups/plugins` directory for the exact names
	plugins = {
		-- examples:
		-- rainbow_delimiters = true
		-- which_key = false
	},
}

---@type KanagawaConfig
M.options = nil

---@param options? KanagawaConfig
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? KanagawaConfig
function M.extend(opts)
	return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.defaults
		end
	end,
})

return M
