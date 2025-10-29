describe("extra is loadable", function()
	local extras = require("kanagawa-paper.extras")

	for name in vim.fs.dir("lua/kanagawa-paper/extras") do
		name = name:match("(.+)%.lua$")
		if name ~= "init" then
			it(name .. " has a generate function", function()
				local extra = require("kanagawa-paper.extras." .. name)
				assert.is_function(extra.generate)
			end)

			it(name .. " has a generate palette function if applicable", function()
				local extra = require("kanagawa-paper.extras." .. name)
				if extras.mapping[name].palette then
					assert.is_function(extra.generate_palette)
				end
			end)

			it(name .. " has a mapping", function()
				assert.is_true(extras.mapping[name] ~= nil)
			end)

			it(name .. " has an extension", function()
				assert.is_true(extras.mapping[name].ext ~= nil)
			end)

			it(name .. " has a url", function()
				assert.is_true(extras.mapping[name].url ~= nil)
			end)
		end
	end
end)
