-- Resolve application mappings against shared data without loading Neovim's theme.
local root = vim.uv.cwd()
package.path = root .. "/shared/lua/?.lua;" .. root .. "/shared/lua/?/init.lua;" .. package.path
local palette = require("kanagawa-paper.palette")
local output = assert(arg[1], "output directory required")
for _, variant in ipairs({ "ink", "canvas" }) do
	local theme = require("kanagawa-paper.themes." .. variant).get({ gutter = false }, palette)
	local inputs = { palette = palette, theme = theme }
	local function resolve(value)
		if type(value) == "table" then
			for key, item in pairs(value) do
				value[key] = resolve(item)
			end
		elseif type(value) == "string" and value:sub(1, 1) == "@" then
			local reference, alpha = value:match("^@([^:]+):?(%x*)$")
			assert(reference, "Invalid color reference: " .. value)
			local color = vim.tbl_get(inputs, unpack(vim.split(reference, ".", { plain = true })))
			assert(type(color) == "string" and color:match("^#%x%x%x%x%x%x$"), "Unknown color: " .. value)
			assert(#alpha == 0 or #alpha == 2, "Invalid alpha: " .. value)
			return color .. alpha
		end
		return value
	end
	local filename = "kanagawa-paper-" .. variant .. "-color-theme.json"
	local source = table.concat(vim.fn.readfile("packages/vscode/mappings/" .. filename), "\n")
	vim.fn.mkdir(output, "p")
	vim.fn.writefile({ vim.json.encode(resolve(vim.json.decode(source))) }, output .. "/" .. filename)
end
