local M = {
	module = "kanagawa-paper",
	colorscheme = "kanagawa-paper-canvas",
	opts = { _theme = "canvas", all_plugins = true },
	globals = { vim = vim },
	cache = {}, ---@type table<string, boolean>
}

function M.reset()
	local colors = require("kanagawa-paper.colors").setup({ _theme = M.opts._theme })
	M.globals.theme = colors.theme
	M.globals.palette = colors.palette
end

---@param name string
---@param buf number
function M.hl_group(name, buf)
	return vim.api.nvim_buf_get_name(buf):find("kinds") and "LspKind" .. name or name
end

local function reload()
	print("🚀 Reloading " .. M.module)
	for k in pairs(package.loaded) do
		if k:find("^" .. M.module) then
			package.loaded[k] = nil
		end
	end
	M.cache = {}
	require(M.module).setup(M.opts)
	M.reset()
	local colorscheme = vim.g.colors_name or M.colorscheme
	colorscheme = colorscheme:find(M.colorscheme) and colorscheme or M.colorscheme
	vim.cmd.colorscheme(colorscheme)
	local hi = require("mini.hipatterns")
	for _, buf in ipairs(require("mini.hipatterns").get_enabled_buffers()) do
		hi.update(buf)
	end
end
reload = vim.schedule_wrap(reload)

local augroup = vim.api.nvim_create_augroup("colorscheme_dev", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	group = augroup,
	callback = reload,
})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = augroup,
	pattern = "*/lua/" .. M.module .. "/**.lua",
	callback = reload,
})

return {
	{
		"nvim-mini/mini.hipatterns",
		opts = function(_, opts)
			local hi = require("mini.hipatterns")

			opts.highlighters = opts.highlighters or {}

			opts.highlighters = vim.tbl_extend("keep", opts.highlighters or {}, {
				hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),

				hl_group = {
					pattern = function(buf)
						return vim.api.nvim_buf_get_name(buf):find("lua/" .. M.module)
							and '^%s*%[?"?()[%w%.@]+()"?%]?%s*='
					end,
					group = function(buf, match)
						local group = M.hl_group(match, buf)
						if group then
							if M.cache[group] == nil then
								M.cache[group] = false
								local hl = vim.api.nvim_get_hl(0, { name = group, link = false, create = false })
								if not vim.tbl_isempty(hl) then
									hl.fg = hl.fg or vim.api.nvim_get_hl(0, { name = "Normal", link = false }).fg
									M.cache[group] = true
									vim.api.nvim_set_hl(0, group .. "Dev", hl)
								end
							end
							return M.cache[group] and group .. "Dev" or nil
						end
					end,
					extmark_opts = { priority = 2000 },
				},

				hl_color = {
					pattern = {
						"%f[%w]()palette%.[%w_%.]+()%f[%W]",
						"%f[%w]()theme%.[%w_%.]+()%f[%W]",
						"%f[%w]()vim%.g%.terminal_color_%d+()%f[%W]",
					},
					group = function(_, match)
						local parts = vim.split(match, ".", { plain = true })
						local color = vim.tbl_get(M.globals, unpack(parts))
						return type(color) == "string"
							and require("mini.hipatterns").compute_hex_color_group(color, "fg")
					end,
					extmark_opts = function(_, _, data)
						return {
							virt_text = { { "⬤ ", data.hl_group } },
							virt_text_pos = "inline",
							priority = 2000,
						}
					end,
				},
			})
		end,
	},
}
