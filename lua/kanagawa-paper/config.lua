local M = {}

---@class KanagawaConfig
M.defaults = {
	theme = "kanagawa-paper", -- one of "ink" or "canvas"

	undercurl = true,
	transparent = false,
	gutter = false,
	diagBackground = true, -- background for diagnostic virtual text
	dimInactive = true, -- disabled when transparent
	terminalColors = true,
	brightnessOffset = 0, -- adjust brightness of the theme [-1, 1]
	saturationOffset = 0, -- adjust saturation of the theme [-1, 1]

	commentStyle = { italic = true },
	functionStyle = { italic = false },
	keywordStyle = { italic = false, bold = false },
	statementStyle = { italic = false, bold = false },
	typeStyle = { italic = false },

	colors = { palette = {}, theme = { ink = {}, canvas = {} } }, -- override default palette and theme colors
	overrides = function(colors) -- override highlight groups
		return {}
	end,

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
