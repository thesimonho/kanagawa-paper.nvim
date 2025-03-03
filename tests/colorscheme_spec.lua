local Config = require("kanagawa-paper.config")

describe("plugin loads", function()
	it("did proper init", function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("default")
		Config.setup()
		assert.same("default", vim.g.colors_name)
		assert.same("dark", vim.o.background)
	end)
end)

describe("loading respects vim.o.background", function()
	before_each(function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("default")
		Config.setup()
	end)

	it("= dark", function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("kanagawa-paper")
		assert.same("dark", vim.o.background)
		assert.same("kanagawa-paper-ink", vim.g.colors_name)
	end)

	it("= light", function()
		vim.o.background = "light"
		vim.cmd.colorscheme("kanagawa-paper")
		assert.same("light", vim.o.background)
		assert.same("kanagawa-paper-canvas", vim.g.colors_name)
	end)

	it("= dark with ink", function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("kanagawa-paper-ink")
		assert.same("dark", vim.o.background)
		assert.same("kanagawa-paper-ink", vim.g.colors_name)
	end)

	it("= light with canvas", function()
		vim.o.background = "light"
		vim.cmd.colorscheme("kanagawa-paper-canvas")
		assert.same("light", vim.o.background)
		assert.same("kanagawa-paper-canvas", vim.g.colors_name)
	end)

	it("= dark with canvas", function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("kanagawa-paper-canvas")
		assert.same("light", vim.o.background)
		assert.same("kanagawa-paper-canvas", vim.g.colors_name)
	end)

	it("= light with ink", function()
		vim.o.background = "light"
		vim.cmd.colorscheme("kanagawa-paper-ink")
		assert.same("dark", vim.o.background)
		assert.same("kanagawa-paper-ink", vim.g.colors_name)
	end)

	it(" and switches to light", function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("kanagawa-paper-ink")
		vim.o.background = "light"
		assert.same("light", vim.o.background)
		assert.same("kanagawa-paper-canvas", vim.g.colors_name)
	end)

	it(" and switches to dark", function()
		vim.o.background = "light"
		vim.cmd.colorscheme("kanagawa-paper-canvas")
		vim.o.background = "dark"
		assert.same("dark", vim.o.background)
		assert.same("kanagawa-paper-ink", vim.g.colors_name)
	end)

	it(" and remembers dark", function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("kanagawa-paper-ink")
		vim.o.background = "light"
		vim.o.background = "dark"
		assert.same("dark", vim.o.background)
		assert.same("kanagawa-paper-ink", vim.g.colors_name)
	end)

	it(" and remembers light", function()
		vim.o.background = "light"
		vim.cmd.colorscheme("kanagawa-paper-canvas")
		vim.o.background = "dark"
		vim.o.background = "light"
		assert.same("light", vim.o.background)
		assert.same("kanagawa-paper-canvas", vim.g.colors_name)
	end)
end)

describe("loading respects user config", function()
	before_each(function()
		vim.cmd.colorscheme("default")
		Config.setup()
	end)

	it(" handles dark auto theme", function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("kanagawa-paper")
		assert.same("dark", vim.o.background)
		assert.same("kanagawa-paper-ink", vim.g.colors_name)
	end)

	it(" handles light auto theme", function()
		vim.o.background = "light"
		vim.cmd.colorscheme("kanagawa-paper")
		assert.same("light", vim.o.background)
		assert.same("kanagawa-paper-canvas", vim.g.colors_name)
	end)
end)
