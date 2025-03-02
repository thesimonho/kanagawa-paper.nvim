local M = {}
M.plugins = {}

-- Get and store all available plugins
function M.get_all_plugins()
	local plugin_dir = vim.api.nvim_get_runtime_file("**/kanagawa-paper/groups/plugins", false)
	if #plugin_dir > 0 then
		local plugin_root = plugin_dir[1]
		local scan = vim.uv.fs_scandir(plugin_root)
		if scan then
			while true do
				local name, type = vim.uv.fs_scandir_next(scan)
				if not name then
					break
				end
				-- each plugin spec is assumed to be a lua file
				if type == "file" then
					local basename = vim.fn.fnamemodify(name, ":t:r")
					M.plugins[#M.plugins + 1] = basename
				end
			end
		end
	end
end

---@param colors KanagawaColors
---@param opts? KanagawaConfig
---@return KanagawaGroups
function M.setup(colors, opts)
	opts = opts or require("kanagawa-paper.config").options

	---@type KanagawaGroups
	local groups = {}

	-- add base groups
	for _, group in ipairs({ "editor", "syntax", "treesitter", "lsp", "ft" }) do
		local mod = require("kanagawa-paper.groups." .. group)
		for hl, spec in pairs(mod.setup(colors, opts)) do
			groups[hl] = spec
		end
	end

	-- determine plugin groups based on user config
	M.get_all_plugins()
	local enabled_plugins = {}
	if opts.all_plugins then
		for _, plugin in ipairs(M.plugins) do
			enabled_plugins[plugin] = true
		end
	elseif opts.auto_plugins and package.loaded.lazy then
		local installed = {}
		for plugin, _ in pairs(require("lazy.core.config").plugins) do
			table.insert(installed, plugin)
		end
		local installed_string = table.concat(installed, "|")

		for _, plugin in ipairs(M.plugins) do
			local renamed = plugin:gsub("_", "-")
			if string.find(installed_string, renamed, 1, true) then
				enabled_plugins[plugin] = true
			end
		end
	end

	enabled_plugins = vim.tbl_extend("force", enabled_plugins, opts.plugins)

	-- add groups
	for plugin, enabled in pairs(enabled_plugins) do
		if enabled then
			-- use pcall to avoid error if plugin doesnt exist
			local ok, res = pcall(require, "kanagawa-paper.groups.plugins." .. plugin)
			if not ok then
				vim.notify("Error loading theme plugin: " .. plugin .. "\n" .. res, vim.log.levels.ERROR)
			else
				for hl, spec in pairs(res.get(colors, opts)) do
					groups[hl] = spec
				end
			end
		end
	end

	-- apply user overrides
	for hl, spec in pairs(opts.overrides(colors)) do
		if groups[hl] and next(spec) then
			groups[hl].link = nil
		end
		groups[hl] = vim.tbl_extend("force", groups[hl] or {}, spec)
	end

	return groups
end

return M
