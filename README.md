# 🌊 kanagawa-paper.nvim

Remixed light and dark Kanagawa color scheme with muted colors. For Neovim.

![screenshot](https://github.com/thesimonho/kanagawa-paper.nvim/assets/5199715/cf75d935-d8b4-430c-a1d8-04f453151924)

## 💡 Motivation

I love the original [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) color scheme, but I found some of the colors of the dark themes a bit too bright and distracting. What I wanted was a more muted theme overall, using less saturated colors inspired by the original theme.

kanagawa-paper provides 2 theme variants; `canvas` for sunny days and `ink` for late nights.

I have also ported the color scheme to VSCode, which you can find here: [kanagawa-paper.vscode](https://github.com/thesimonho/kanagawa-paper.vscode)

## ⚡️ Requirements

- [Neovim](https://github.com/neovim/neovim) >=
  [0.8.0](https://github.com/neovim/neovim/releases/tag/v0.8.0)

## 📦 Installation

Install the theme with your preferred package manager, such as [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

## 🚀 Usage

### Vim Script

```vim
colorscheme kanagawa-paper
colorscheme kanagawa-paper-ink
colorscheme kanagawa-paper-canvas
```

### Lua

```lua
vim.cmd("colorscheme kanagawa-paper")
vim.cmd("colorscheme kanagawa-paper-ink")
vim.cmd("colorscheme kanagawa-paper-canvas")
```

## ⚙️ Configuration

> [!IMPORTANT]
> Set the configuration **BEFORE** loading the color scheme with `colorscheme kanagawa-paper`.

```lua
require("kanagawa-paper").setup({
  --- "ink" : dark theme
  --- "canvas" : light theme
  --- "kanagawa-paper" : automatically set theme based on background color
 theme = "kanagawa-paper",

 -- features and appearance
 undercurl = true,
 transparent = false,
 gutter = false,
 diagBackground = true, -- background for diagnostic virtual text
 dimInactive = true, -- disabled when transparent
 terminalColors = true,
 brightnessOffset = 0, -- adjust brightness of the theme [-1, 1]
 saturationOffset = 0, -- adjust saturation of the theme [-1, 1]

 -- style options
 commentStyle = { italic = true },
 functionStyle = { italic = false },
 keywordStyle = { italic = false, bold = false },
 statementStyle = { italic = false, bold = false },
 typeStyle = { italic = false },

 -- color overrides
 colors = { palette = {}, theme = {ink = {}, canvas = {}} }, -- override default palette and theme colors
 overrides = function(colors) -- override highlight groups
  return {}
 end,

 -- enable/disable plugins
 auto_plugins = true, -- uses lazy.nvim, if installed, to automatically enable needed plugins
 all_plugins = package.loaded.lazy == nil, -- enable highlights for all plugins (disabled if using lazy.nvim)
 plugins = {
  -- manually enable/disable individual plugins
  -- check the `groups/plugins` directory for the exact names
  -- examples:
  -- rainbow_delimiters = true
  -- which_key = false
 },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa-paper")
```

The default configuration can be found [here](lua/kanagawa-paper/config.lua)

If you want to switch between light and dark themes within a Neovim session, you can set the theme to `kanagawa-paper` and change `vim.o.background` to `light` or `dark`.

This can also be mapped to the time of day via an autocommand or dynamically setting `vim.o.background` at startup. For example:

```lua
local hour = os.date("*t").hour
vim.o.background = (hour >= 7 and hour < 19) and "light" or "dark"
```

## [Lualine](https://github.com/nvim-lualine/lualine.nvim)

This color scheme comes with matching Lualine themes for both `ink` and `canvas` variants. This will set the theme at startup:

```lua
local kanagawa_paper = require("lualine.themes.kanagawa-paper") -- switches based on vim.o.background
-- local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")
-- local kanagawa_paper = require("lualine.themes.kanagawa-paper-canvas")

require("lualine").setup({
 options = {
  theme = kanagawa_paper,
  -- ... your lualine config
 },
})
```

For a more advanced use case you can make use of the stored global variable `vim.g.colors_name` to dynamically set the Lualine theme:

```lua
require("lualine").setup({
 options = {
  theme = function()
    if vim.g.colors_name then
      -- pcall to handle the case of theme switching/previewing
      local ok, t = pcall(require, "lualine.themes." .. vim.g.colors_name)
      if ok then
        return t
      end
    end
    -- default fallback
    return require("lualine.themes.kanagawa-paper")
  end,
  -- ...
 },
})
```

Examples of situations where this might be useful:

- You want to change the theme mid-session
- You want to change background color mid-session (either by manually setting `vim.o.background` or with something like dark background toggle in LazyVim)
- You use a plugin for live previews of color schemes

## 🔧 Customizing Colors

There are two kinds of colors: `PaletteColors` and `ThemeColors`.

`PaletteColors` are defined directly as RGB Hex strings, and have arbitrary names
that recall their actual color. Conversely, `ThemeColors` are named and grouped _semantically_
on the basis of their actual function.

In short, a `palette` defines all the available colors, while a `theme` maps the `PaletteColors`
to specific `ThemeColors` and the same palette color may be assigned to multiple theme colors.

You can change _both_ theme or palette colors using `config.colors`.
All the palette color names can be found [here](lua/kanagawa-paper/colors.lua),
while their usage by each theme can be found [here](lua/kanagawa-paper/themes).

```lua
require('kanagawa-paper').setup({
  colors = {
    palette = {
      -- change all usages of these color names
      sumiInk0 = "#000000",
      fujiWhite = "#FFFFFF",
    },
    theme = {
      -- change specific usages for a specific theme
      ink = {
        ui = {
          float = {
            fg = "#ff0000,
          },
        },
      },
      canvas = {
      -- ...
      }
    },
  }
})
```

You can also conveniently add/modify `hlgroups` using the `config.overrides` option.
Supported keywords are the same for `:h nvim_set_hl` `{val}` parameter.

```lua
require("kanagawa-paper").setup({
 overrides = function(colors)
  return {
   -- Assign a static color to strings
   String = { fg = colors.palette.carpYellow, italic = true },
   -- theme colors will update dynamically when you change theme!
   SomePluginHl = { fg = colors.theme.syn.type, bold = true },
  }
 end,
})
```

You can find a more detailed explanation of color customization [here](https://github.com/thesimonho/kanagawa-paper.nvim/issues/3#issuecomment-2183665367).

### Extracting colors

```lua
-- Get the colors for the current theme
local colors = require("kanagawa-paper.colors").setup()
local palette_colors = colors.palette
local theme_colors = colors.theme
```

### Common customizations

#### Transparent Floating Windows

This will make floating windows look nicer with default borders.

For this to work, make sure you've set winblend to a non-zero value in your config: `vim.opt.winblend = 30`

```lua
overrides = function(colors)
  local theme = colors.theme
  return {
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
    FloatTitle = { bg = "none" },

    -- Save a hlgroup with dark background and dimmed foreground
    -- so that you can use it where you still want darker windows.
    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

    -- Popular plugins that open floats will link to NormalFloat by default;
    -- set their background accordingly if you wish to keep them dark and borderless
    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
  },
end
```

If you'd like to keep the floating windows darker, but you're unhappy with how
borders are rendered, consider using characters that are drawn at the edges of
the box:

```lua
{ "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
```

#### Dark completion (popup) menu

More uniform colors for the popup menu.

```lua
overrides = function(colors)
  local theme = colors.theme
  return {
    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
    PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
    PmenuSbar = { bg = theme.ui.bg_m1 },
    PmenuThumb = { bg = theme.ui.bg_p2 },
  }
end,
```

## 🍭 Extras

- [alacritty](extras/alacritty)
- [ghostty](extras/ghostty)
- [kitty](extras/kitty)
- [terminator](extras/terminator)
- [termux](extras/termux)
- [tilix](extras/tilix)
- [vscode](https://github.com/thesimonho/kanagawa-paper.vscode) (official port)
- [vscode terminal](extras/vscode_terminal) (guide: [Visual Studio Code Theme Color](https://code.visualstudio.com/api/references/theme-color))
- [fzf](extras/fzf) (guide: [fzf color schemes](https://github.com/junegunn/fzf/wiki/Color-schemes))
- [wezterm](extras/wezterm) (guide: [Defining a Color Scheme in a separate file](https://wezfurlong.org/wezterm/config/appearance.html#defining-a-color-scheme-in-a-separate-file))
- [wezterm tabline](extras/wezterm_tabline) (guide: [tabline.wez](https://github.com/michaelbrusegard/tabline.wez))
- [windows terminal](extras/windows_terminal) (guide: [Color schemes in Windows Terminal](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/color-schemes))

## 🔥 Contributing

Pull requests are welcome for theme fixes, new features, and new extras.

For the [extras](extras/), we use a simple template system that can be used to generate styles for the different themes.

How to add a new extra template:

1. Create a new template file in [lua/kanagawa-paper/extras](lua/kanagawa-paper/extras).
2. Add the name and output file extension to the `extras` table in [lua/kanagawa-paper/extras/init.lua](lua/kanagawa-paper/extras/init.lua).
3. To check that your template compiles properly, run `./scripts/build.sh` and check the newly compiled styles in the root [extras](extras/) directory.

> [!IMPORTANT]
> Please DO NOT commit the compiled files, as they are already automatically built by the CI.

## 👏 Acknowledgements

- [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- [Tokyo Night](https://github.com/folke/tokyonight.nvim)
