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

local function load_colors(opts)
	local kanagawa = require("kanagawa-paper")
	opts = vim.tbl_deep_extend("force", { all_plugins = true }, opts or {})
	local ok, colors, groups, kopts = pcall(function()
		return kanagawa.load(opts)
	end)
	if not ok then
		return nil, nil, nil, nil, colors
	end
	return colors, groups, kopts, nil
end

function M.setup()
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
		local ok_plugin, plugin = pcall(require, "kanagawa-paper.extras." .. extra)
		if not ok_plugin then
			goto continue_extra
		end

		-- colors for each theme
		for theme, theme_name in pairs(themes) do
			local colors, groups, kopts, err = load_colors({ _theme = theme })
			if err then
				goto continue_theme
			end

			if colors and colors.theme then
				local filename = extra
					.. (info.subdir and "/" .. info.subdir .. "/" or "")
					.. "/kanagawa-paper"
					.. (info.sep or "-")
					.. theme
					.. "."
					.. info.ext
				filename = string.gsub(filename, "%.$", "") -- remove trailing dot when no extension
				local path = vim.fn.expand("%:p:h") .. "/extras/" .. filename

				local t = vim.deepcopy(colors.theme)
				t["_url"] = info.url
				t["_upstream_url"] = "https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/" .. filename
				t["_package_name"] = "Kanagawa Paper"
				t["_style_name"] = "Kanagawa Paper " .. theme_name
				t["_name"] = "kanagawa-paper-" .. theme
				t["_theme"] = theme
				print("[write] " .. filename)

				local ok_gen, out = pcall(plugin.generate, t, groups, kopts)
				if ok_gen then
					Util.write(path, out)
				end
			end
			::continue_theme::
		end

		-- palette colors, if applicable
		if info.palette == true then
			local colors, groups, kopts, err = load_colors({ _theme = "auto" })
			if err then
				goto continue_palette
			end

			if colors and colors.palette then
				local filename = extra
					.. (info.subdir and "/" .. info.subdir .. "/" or "")
					.. "/kanagawa-paper"
					.. (info.sep or "-")
					.. "palette"
					.. "."
					.. info.ext
				filename = string.gsub(filename, "%.$", "") -- remove trailing dot when no extension
				local path = vim.fn.expand("%:p:h") .. "/extras/" .. filename

				local p = vim.deepcopy(colors.palette)
				p["_url"] = info.url
				p["_upstream_url"] = "https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/" .. filename
				p["_package_name"] = "Kanagawa Paper"
				p["_style_name"] = "Kanagawa Paper Palette"
				p["_name"] = "kanagawa-paper-palette"
				print("[write] " .. filename)

				local ok_genp, outp = pcall(plugin.generate_palette, p, groups, kopts)
				if ok_genp then
					Util.write(path, outp)
				end
			end
			::continue_palette::
		end
	end

	::continue_extra::
end

return M
