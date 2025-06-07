local Util = require("kanagawa-paper.lib.util")

local M = {}

-- map of plugin name to plugin extension
--- @type table<string, {ext:string, url:string, label?:string, subdir?: string, sep?:string}>
-- stylua: ignore
M.mapping = {
  alacritty        = { ext = "toml", url = "https://github.com/alacritty/alacritty", label = "Alacritty" },
  fzf              = { ext = "rc", url = "https://github.com/junegunn/fzf/tree/master#environment-variables", label = "Fzf" },
  ghostty          = { ext = "", url = "https://github.com/ghostty-org/ghostty", label = "Ghostty" },
  kitty            = { ext = "conf", url = "https://sw.kovidgoyal.net/kitty/conf.html", label = "Kitty" },
  lazygit          = { ext = "yml", url = "https://github.com/jesseduffield/lazygit", label = "lazygit" },
  terminator       = { ext = "conf", url = "https://gnome-terminator.readthedocs.io/en/latest/config.html", label = "Terminator" },
  termux           = { ext = "properties", url = "https://termux.dev/", label = "Termux" },
  tilix            = { ext = "jsonc", url = "https://github.com/gnunn1/tilix", label = "Tilix" },
  wezterm          = { ext = "toml", url = "https://wezterm.org/config/appearance.html", label = "Wezterm" },
  wezterm_tabline  = { ext = "lua", url = "https://github.com/michaelbrusegard/tabline.wez", label = "Wezterm Tabline" },
  windows_terminal = { ext = "jsonc", url = "https://learn.microsoft.com/en-us/windows/terminal/customize-settings/color-schemes", label = "Windows Terminal" },
  vscode_terminal  = { ext = "jsonc", url = "https://code.visualstudio.com/api/references/theme-color", label = "VSCode Terminal" },
  foot             = { ext = "ini", url= "https://codeberg.org/dnkl/foot", label = "Foot" },
  vivid             = { ext = "yml", url= "https://github.com/sharkdp/vivid", label = "Vivid" },
}

function M.setup()
	local kanagawa = require("kanagawa-paper")
	vim.o.background = "dark"

	local themes = {
		ink = "Ink",
		canvas = "Canvas",
	}

	---@type string[]
	local names = vim.tbl_keys(M.mapping)
	table.sort(names)

	for _, extra in ipairs(names) do
		local info = M.mapping[extra]
		local plugin = require("kanagawa-paper.extras." .. extra)
		for theme, theme_name in pairs(themes) do
			local colors, groups, opts = kanagawa.load({ _theme = theme, all_plugins = true })
			local fname = extra
				.. (info.subdir and "/" .. info.subdir .. "/" or "")
				.. "/kanagawa-paper"
				.. (info.sep or "-")
				.. theme
				.. "."
				.. info.ext
			fname = string.gsub(fname, "%.$", "") -- remove trailing dot when no extension
			local path = vim.fn.expand("%:p:h") .. "/extras/" .. fname

			colors.theme["_url"] = info.url
			colors.theme["_upstream_url"] = "https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/" .. fname
			colors.theme["_package_name"] = "Kanagawa Paper"
			colors.theme["_style_name"] = "Kanagawa Paper " .. theme_name
			colors.theme["_name"] = "kanagawa-paper-" .. theme
			colors.theme["_theme"] = theme
			print("[write] " .. fname)

			Util.write(path, plugin.generate(colors.theme, groups, opts))
		end
	end
end

return M
