local M = {}

---@param opts? KanagawaConfig
---@param palette PaletteColors
---@return ThemeColors
function M.setup(opts, palette)
	opts = opts or require("kanagawa-paper.config").options
	return require("kanagawa-paper.themes." .. opts.theme).get(opts, palette)
end

return M
