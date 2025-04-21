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
<div style="display: flex; flex-wrap: wrap; gap: 12px;">
]])

for _, name in ipairs(ordered) do
	local hex = palette[name]
	md:write(string.format(
		[[
  <div style="flex: 0 0 auto; width: 100px; border: 1px solid #bcbcbc; border-radius: 4px; overflow: hidden; font-family: sans-serif;">
    <div style="height: 50px; background: %s;"></div>
    <div style="padding: 4px; font-size: 12px; text-align: center;">
      <strong>%s</strong><br/>
      <code>%s</code>
    </div>
  </div>
]],
		hex,
		name,
		hex
	))
end

md:write("\n</div>\n")

md:close()
