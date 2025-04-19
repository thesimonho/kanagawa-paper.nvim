local M = {}

function M.get(colors, opts)
	local theme = colors.theme

	return {
		YankyYanked = { bg = theme.modes.visual },
		YankyPut = { bg = theme.modes.insert },
	}
end

return M
