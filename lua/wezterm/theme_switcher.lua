--- CONFIG BEGIN ---
-- default colorscheme after neovim exits
local theme_default = "kanagawa-paper-ink"

-- this should match the path set in the neovim config
-- it's best to use a temporary directory for this
local theme_file = (os.getenv("TEMP") or "/tmp") .. "/nvim-theme"

-- relative path to the directory containing the tabline themes
-- e.g. if I have placed the tabline extra themes in ./colors/wezterm_tabline then this would be "colors.wezterm_tabline"
-- this is treated as a relative lua module that will be required by the theme switcher
local tabline_theme_dir = "colors.wezterm_tabline"
--- CONFIG END ---

local wezterm = require("wezterm")
local tabline

-- NOTE: file must exist for watch list reloading to work
local f = io.open(theme_file, "r") ~= nil
if not f then
	io.open(theme_file, "w"):close()
end
wezterm.add_to_config_reload_watch_list(theme_file)

local M = {}

function M.is_plugin_installed(url)
	M.plugins = wezterm.plugin.list()
	for _, p in ipairs(M.plugins) do
		if p.url and string.find(p.url, url, 1, true) then
			return true
		end
	end
	return false
end

function M.read_theme()
	local file = io.open(theme_file, "r")
	if file then
		local theme = file:read("*all"):gsub("\n", "")
		file:close()
		if theme == "" then
			return nil
		end
		return theme
	end
	return nil
end

function M.apply_theme(window, theme)
	window:set_config_overrides({
		color_scheme = theme,
	})
end

function M.apply_tabline_theme(theme)
	if tabline and theme == "kanagawa-paper-ink" then
		tabline.set_theme(M.ink)
	elseif tabline and theme == "kanagawa-paper-canvas" then
		tabline.set_theme(M.canvas)
	end
end

if M.is_plugin_installed("michaelbrusegard/tabline.wez") then
	tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
	local ok_ink, ink = pcall(require, tabline_theme_dir .. ".kanagawa-paper-ink")
	local ok_canvas, canvas = pcall(require, tabline_theme_dir .. ".kanagawa-paper-canvas")
	if not ok_ink or not ok_canvas then
		print("Error loading tabline themes")
	end
	M.ink = ink
	M.canvas = canvas
end

wezterm.on("window-config-reloaded", function(window, _)
	local new_theme = M.read_theme()
	if not new_theme then
		new_theme = theme_default
	end

	M.apply_theme(window, new_theme)

	if M.is_plugin_installed("michaelbrusegard/tabline.wez") then
		M.apply_tabline_theme(new_theme)
	end
end)

return M
