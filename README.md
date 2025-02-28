# 🌊 kanagawa-paper.nvim

Remixed light and dark Kanagawa colourscheme with muted colors. For Neovim.

![screenshot](https://github.com/thesimonho/kanagawa-paper.nvim/assets/5199715/cf75d935-d8b4-430c-a1d8-04f453151924)

## 💡 Motivation

I love the original [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) colourscheme, but I found some of the colours of the dark themes a bit too bright and distracting. What I wanted was a more muted theme overall, combining the less saturated syntax colours of the dragon theme, while keeping the blue background of the wave theme.

kanagawa-paper combines both the dragon and wave themes, with a few additions and tweaks to work better with certain plugins.

I have also ported the colourscheme to VSCode, which you can find here: [kanagawa-paper.vscode](https://github.com/thesimonho/kanagawa-paper.vscode)

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
```

### Lua

```lua
vim.cmd("colorscheme kanagawa-paper")
```

### External Plugins

#### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

```lua
local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")
-- local kanagawa_paper = require("lualine.themes.kanagawa-paper-canvas")

require("lualine").setup({
 options = {
  theme = kanagawa_paper,
  -- ... your lualine config
 },
})
```

If you want to set the lualine theme dynamically to match the Neovim theme, you can do something like this:

```lua
require("lualine").setup({
 options = {
  theme = function()
   return require("lualine.themes." .. vim.g.colors_name)
  end,
  -- ...
 },
})
```

## ⚙️ Configuration

> ❗️ Set the configuration **BEFORE** loading the color scheme with `colorscheme kanagawa-paper`.

```lua
require("kanagawa-paper").setup({
 theme = "ink", -- one of "ink" or "canvas"

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
 overrides = function() -- override highlight groups
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

The code that defines the default configuration can be found [here](lua/kanagawa-paper/config.lua)

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

PRs are welcome if you want to add an extra for a specific application.

## 👏 Acknowledgements

- [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- [Tokyo Night](https://github.com/folke/tokyonight.nvim)
