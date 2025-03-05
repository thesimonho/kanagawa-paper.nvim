local Config = require("kanagawa-paper.config")
local util = require("kanagawa-paper.lib.util")

describe("wezterm themes are updated", function()
	before_each(function()
		Config.setup({
			integrations = {
				wezterm = {
					enabled = true,
				},
			},
		})
	end)

	it("auto theme updates on init", function()
		vim.cmd.colorscheme("kanagawa-paper")
		local theme = util.read(Config.options.integrations.wezterm.path)
		assert.same("kanagawa-paper-ink", theme)
	end)

	it("ink theme updates on init", function()
		vim.cmd.colorscheme("kanagawa-paper-ink")
		local theme = util.read(Config.options.integrations.wezterm.path)
		assert.same("kanagawa-paper-ink", theme)
	end)

	it("canvas theme updates on init", function()
		vim.cmd.colorscheme("kanagawa-paper-canvas")
		local theme = util.read(Config.options.integrations.wezterm.path)
		assert.same("kanagawa-paper-canvas", theme)
	end)

	it("auto theme updates on change", function()
		vim.cmd.colorscheme("kanagawa-paper")
		vim.o.background = "light"
		local theme = util.read(Config.options.integrations.wezterm.path)
		assert.same("kanagawa-paper-canvas", theme)
	end)

	it("ink theme updates on change", function()
		vim.cmd.colorscheme("kanagawa-paper-ink")
		vim.o.background = "light"
		local theme = util.read(Config.options.integrations.wezterm.path)
		assert.same("kanagawa-paper-canvas", theme)
	end)

	it("canvas theme updates on change", function()
		vim.cmd.colorscheme("kanagawa-paper-canvas")
		vim.o.background = "dark"
		local theme = util.read(Config.options.integrations.wezterm.path)
		assert.same("kanagawa-paper-ink", theme)
	end)
end)
