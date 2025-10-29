local Util = require("kanagawa-paper.lib.util")

local M = {}

-- map of plugin name to plugin extension
--- @type table<string, {ext:string, url:string, label?:string, subdir?: string, sep?:string, palette?:boolean}>
-- stylua: ignore
M.mapping = {
  alacritty        = { ext = "toml", url = "https://github.com/alacritty/alacritty", label = "Alacritty" },
  foot             = { ext = "ini", url= "https://codeberg.org/dnkl/foot", label = "Foot" },
  fzf              = { ext = "rc", url = "https://github.com/junegunn/fzf/tree/master#environment-variables", label = "Fzf" },
  ghostty          = { ext = "", url = "https://github.com/ghostty-org/ghostty", label = "Ghostty" },
  kitty            = { ext = "conf", url = "https://sw.kovidgoyal.net/kitty/conf.html", label = "Kitty" },
  lazygit          = { ext = "yml", url = "https://github.com/jesseduffield/lazygit", label = "lazygit" },
  nushell          = { ext = "nu", url = "https://www.nushell.sh/", label = "Nushell" },
  tailwind         = { ext = "css", url = "https://tailwindcss.com/", label = "tailwind", palette = true },
  terminator       = { ext = "conf", url = "https://gnome-terminator.readthedocs.io/en/latest/config.html", label = "Terminator" },
  termux           = { ext = "properties", url = "https://termux.dev/", label = "Termux" },
  tilix            = { ext = "jsonc", url = "https://github.com/gnunn1/tilix", label = "Tilix" },
  wezterm          = { ext = "toml", url = "https://wezterm.org/config/appearance.html", label = "Wezterm" },
  wezterm_tabline  = { ext = "lua", url = "https://github.com/michaelbrusegard/tabline.wez", label = "Wezterm Tabline" },
  windows_terminal = { ext = "jsonc", url = "https://learn.microsoft.com/en-us/windows/terminal/customize-settings/color-schemes", label = "Windows Terminal" },
  vscode_terminal  = { ext = "jsonc", url = "https://code.visualstudio.com/api/references/theme-color", label = "VSCode Terminal" },
  vivid            = { ext = "yml", url= "https://github.com/sharkdp/vivid", label = "Vivid" },
}

function M.setup()
	local kanagawa = require("kanagawa-paper")
	vim.o.background = "dark"

	local themes = {
		ink = "Ink",
		canvas = "Canvas",
		palette = "Palette",
	}

	---@type string[]
	local names = vim.tbl_keys(M.mapping)
	table.sort(names)

	for _, extra in ipairs(names) do
		local info = M.mapping[extra]
		for theme, theme_name in pairs(themes) do
			local plugin, colors, groups, opts, color_data
			if theme == "palette" then
				if info.palette then
					plugin = require("kanagawa-paper.extras." .. extra .. "_palette")
					colors, groups, opts = kanagawa.load({ _theme = "auto", all_plugins = true })
					color_data = { palette = colors.palette }
				end
			else
				plugin = require("kanagawa-paper.extras." .. extra)
				colors, groups, opts = kanagawa.load({ _theme = theme, all_plugins = true })
				color_data = colors.theme
			end

			if color_data then
				local filename = extra
					.. (info.subdir and "/" .. info.subdir .. "/" or "")
					.. "/kanagawa-paper"
					.. (info.sep or "-")
					.. theme
					.. "."
					.. info.ext
				filename = string.gsub(filename, "%.$", "") -- remove trailing dot when no extension
				local path = vim.fn.expand("%:p:h") .. "/extras/" .. filename

				color_data["_url"] = info.url
				color_data["_upstream_url"] = "https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/"
					.. filename
				color_data["_package_name"] = "Kanagawa Paper"
				color_data["_style_name"] = "Kanagawa Paper " .. theme_name
				color_data["_name"] = "kanagawa-paper-" .. theme
				color_data["_theme"] = theme
				print("[write] " .. filename)

				Util.write(path, plugin.generate(color_data, groups, opts))
			end
		end
	end
end

return M
