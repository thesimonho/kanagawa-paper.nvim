package.path = "lua/?.lua;lua/?/init.lua;lua/?/?.lua;" .. package.path
local palette = require("kanagawa-paper.colors").palette

local ordered = {}
for name in pairs(palette) do
	table.insert(ordered, name)
end
table.sort(ordered)

local md = io.open("palette_colors.md", "w")

if not md then
	error("Could not open palette_colors.md for writing")
end

md:write("# Palette Colors\n\n")
md:write("(this file is auto generated from `lua/kanagawa-paper/colors.lua`)\n\n")

md:write([[
| Name  | Color  | Hex   |
| ----- | :----: | :---: |
]])

for _, name in ipairs(ordered) do
	local hex = palette[name]:sub(2)
	md:write(string.format(
		[[
| **%s** | ![%s](https://placehold.co/40x15/%s/%s.png) | `#%s` |
]],
		name,
		hex,
		hex,
		hex,
		hex
	))
end

md:close()
