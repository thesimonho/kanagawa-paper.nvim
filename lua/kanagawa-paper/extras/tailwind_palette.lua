local util = require("kanagawa-paper.lib.util")

local function build_palette_map(palette, package)
	-- sort keys for stable output
	local keys = {}
	for k in pairs(palette) do
		table.insert(keys, k)
	end
	table.sort(keys, function(a, b)
		return a:lower() < b:lower()
	end)

	package = package:lower():gsub("%s+", "-")
	local lines = {}
	for _, name in ipairs(keys) do
		local var = "--color-" .. package .. "-" .. util.to_kebab_case(name)
		table.insert(lines, string.format("  %s: oklch(from ${palette.%s} l c h);", var, name))
	end

	return table.concat(lines, "\n")
end

local M = {}

--- @param colors PaletteColors
function M.generate(colors)
	local template = string.format(
		[[
/* ----------------------------------------------------------------------------- */
/* ${_style_name} */
/* Upstream: ${_upstream_url} */
/* URL: ${_url} */
/* ----------------------------------------------------------------------------- */

@theme inline {
%s
}
  ]],
		build_palette_map(colors["palette"], colors["_package_name"])
	)

	local tailwind = util.template(template, colors)
	return tailwind
end

return M
