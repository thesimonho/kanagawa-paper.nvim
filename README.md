# 🌊 kanagawa-paper.nvim

<p align="center">
Remixed light and dark Kanagawa color scheme with muted colors. For Neovim.
</p>

<p align="center">
<img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/thesimonho/kanagawa-paper.nvim?style=for-the-badge&labelColor=1F1F28&color=c4b28a">

<img alt="GitHub Release" src="https://img.shields.io/github/v/release/thesimonho/kanagawa-paper.nvim?style=for-the-badge&labelColor=1F1F28&color=887389">

<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/thesimonho/kanagawa-paper.nvim?style=for-the-badge&labelColor=1F1F28&color=5d7a88">

<img alt="GitHub branch check runs" src="https://img.shields.io/github/check-runs/thesimonho/kanagawa-paper.nvim/master?style=for-the-badge&label=build&labelColor=1F1F28&color=699469">

</p>

## 💡 Motivation

I love the original [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) color scheme, but I found some of the colors a bit too bright and distracting. What I wanted was a more muted theme overall, using less saturated colors inspired by the original theme. You can see a visual preview of the color palette [here](palette_colors.md).

Both a light theme and a dark theme are provided.

I have also ported the color scheme to VSCode, which you can find here: [kanagawa-paper.vscode](https://github.com/thesimonho/kanagawa-paper.vscode)

| Ink                                                                                             | Canvas                                                                                             |
| ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| ![ink](https://github.com/user-attachments/assets/d4e551e2-6091-4638-a584-c11201c6cfbd)         | ![canvas](https://github.com/user-attachments/assets/b1d1965b-63e0-4302-8a66-156882429b3e)         |
| ![ink_palette](https://github.com/user-attachments/assets/ec7b304f-f318-4a83-a9af-bd44fce36bd2) | ![canvas_palette](https://github.com/user-attachments/assets/7dce8e71-e650-4b85-8efc-139ad6f4f849) |

## ⚡️ Requirements

- [Neovim](https://github.com/neovim/neovim) >= [0.8.0](https://github.com/neovim/neovim/releases/tag/v0.8.0)
- truecolor terminal support
- undercurl terminal support (optional)

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

Kanagawa Paper comes in a few variants:

- `kanagawa-paper-ink` for late nights
- `kanagawa-paper-canvas` for sunny days
- `kanagawa-paper` for automatic theme switching based on `vim.o.background`

Themes can be changed in a couple of ways:

- Using the background option:
  Any change to the value of `vim.o.background` will select the corresponding light or dark theme. If this is unset, the theme will default to the dark theme `ink`.
- Loading the color scheme directly with:

Vim:

```vim
colorscheme kanagawa-paper
colorscheme kanagawa-paper-ink
colorscheme kanagawa-paper-canvas
```

Neovim:

```lua
vim.cmd.colorscheme("kanagawa-paper")
vim.cmd.colorscheme("kanagawa-paper-ink")
vim.cmd.colorscheme("kanagawa-paper-canvas")
```

A full plugin spec example using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("kanagawa-paper-ink")
  end,
  opts = {...},
}
```

## 🛠️ Configuration

> [!NOTE]
> Config options have changed between v1 and v2 of the color scheme.

> [!IMPORTANT]
> Set the configuration **BEFORE** loading the color scheme to ensure the settings are applied, otherwise defaults will be used.

The default configuration can be found [here](lua/kanagawa-paper/config.lua)

```lua
require("kanagawa-paper").setup({
 -- enable undercurls for underlined text
 undercurl = true,
 -- transparent background
 transparent = false,
 -- highlight background for the left gutter
 gutter = false,
 -- background for diagnostic virtual text
 diag_background = true,
 -- dim inactive windows. Disabled when transparent
 dim_inactive = false,
 -- set colors for terminal buffers
 terminal_colors = true,
 -- cache highlights and colors for faster startup.
 -- see Cache section for more details.
 cache = false,

 styles = {
  -- style for comments
  comment = { italic = true },
  -- style for functions
  functions = { italic = false },
  -- style for keywords
  keyword = { italic = false, bold = false },
  -- style for statements
  statement = { italic = false, bold = false },
  -- style for types
  type = { italic = false },
 },
 -- override default palette and theme colors
 colors = {
  palette = {},
  theme = {
   ink = {},
   canvas = {},
  },
 },
 -- adjust overall color balance for each theme [-1, 1]
 color_offset = {
  ink = { brightness = 0, saturation = 0 },
  canvas = { brightness = 0, saturation = 0 },
 },
 -- override highlight groups
 overrides = function(colors)
  return {}
 end,

 -- uses lazy.nvim, if installed, to automatically enable needed plugins
 auto_plugins = true,
 -- enable highlights for all plugins (disabled if using lazy.nvim)
 all_plugins = package.loaded.lazy == nil,
 -- manually enable/disable individual plugins.
 -- check the `groups/plugins` directory for the exact names
 plugins = {
  -- examples:
  -- rainbow_delimiters = true
  -- which_key = false
 },
})
```

### Cache

The color scheme comes with a cache option that can be used to speed up startup time.

When you set `cache = true` in your config, the theme colors and all of your edits/adjustments will be saved to a cache file. This is loaded at startup so colors don't need to be recomputed every time.

Any changes you make to your config (e.g. overriding colors or highlight groups) should automatically invalidate the cache and build a new one.

In rare cases where this doesn't happen and you notice your changes aren't being applied, you can manually rebuild the cache by running `:KanagawaPaperCache`.

## 👥 Integrations

### Terminals

Matching colorschemes for a number of terminals are provided (e.g. WezTerm, ghostty, etc; see [Extras](https://github.com/thesimonho/kanagawa-paper.nvim#-extras)).

The automatic variant of `kanagawa-paper` switches between light and dark mode based on the value of `vim.o.background`. This value will generally follow the color mode of your terminal, i.e. if your terminal is set to dark mode via your OS, neovim will pick that up and the theme will automatically be changed to `kanagawa-paper-ink`.

Tip: if this auto switching is not working for you, the _first_ thing to check is whether the value of `vim.o.background` is what you expect it to be.

### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

This color scheme comes with matching Lualine themes for both `ink` and `canvas` variants.

This will set the theme at startup:

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

For a more advanced use case you can make use of the background color to set the Lualine theme dynamically. This switches Lualine between light and dark themes based on background color:

```lua
require("lualine").setup({
 options = {
  theme = function()
    -- pcall and fallback theme is to handle the case of theme switching/previewing
    local ok, t = pcall(
      require,
      "lualine.themes." .. (vim.o.background == "light" and "kanagawa-paper-canvas" or "kanagawa-paper-ink")
    )
    if ok then
      theme = t
    else
      theme = require("some other fallback theme")
    end
    return theme
  end,
  -- ... your lualine config
 },
})
```

Examples of situations where this might be useful:

- You want to change the theme mid-session
- You want to change background color mid-session (either by manually setting `vim.o.background` or with something like dark background toggle in LazyVim)
- You use a plugin for live previews of color schemes

### [WezTerm](https://wezfurlong.org/wezterm/) and [WezTerm Tabline](https://github.com/michaelbrusegard/tabline.wez) (deprecated)

This feature has been deprecated. If you'd like to use it, you can still find the old script and instructions (README) in [v3.1](https://github.com/thesimonho/kanagawa-paper.nvim/tree/v3.1?tab=readme-ov-file#-integrations)

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

You can see a visual preview of the entire color palette [here](palette_colors.md).

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
            fg = "#ff0000",
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

You can get the palette and theme colors from the colors module like this:

```lua
-- Get the colors for the current theme
local colors = require("kanagawa-paper.colors")
local palette_colors = colors.palette
local theme_colors = colors.theme
```

and use them in your `opts` function. Example:

```lua
{
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  opts = function()
    local colors = require("kanagawa-paper.colors")
    local palette_colors = colors.palette
    return {
      colors = {
        theme = {
          ink = {
            ui = {
              bg_dim = palette_colors.boatYellow2,
            },
          },
        },
      },
    }
  end
}
```

## 🍭 Extras

- [alacritty](extras/alacritty)
- [foot](extras/foot)
- [ghostty](extras/ghostty)
- [kitty](extras/kitty)
- [nchat](extras/nchat)
- [nushell](extras/nushell)
- [tailwind](extras/tailwind)
- [terminator](extras/terminator)
- [termux](extras/termux)
- [tilix](extras/tilix)
- [vivid](extras/vivid)
- [zellij](extras/zellij)
- [vscode](https://github.com/thesimonho/kanagawa-paper.vscode) (official port)
- [vscode terminal](extras/vscode_terminal) (guide: [Visual Studio Code Theme Color](https://code.visualstudio.com/api/references/theme-color))
- [fzf](extras/fzf) (guide: [fzf color schemes](https://github.com/junegunn/fzf/wiki/Color-schemes))
- [wezterm](extras/wezterm) (guide: [Defining a Color Scheme in a separate file](https://wezfurlong.org/wezterm/config/appearance.html#defining-a-color-scheme-in-a-separate-file))
- [wezterm tabline](extras/wezterm_tabline) (guide: [tabline.wez](https://github.com/michaelbrusegard/tabline.wez))
- [windows terminal](extras/windows_terminal) (guide: [Color schemes in Windows Terminal](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/color-schemes))

## 🔥 Contributing

Pull requests are welcome for theme fixes, new features, and new extras.

Using the [Conventional Commits](https://www.conventionalcommits.org/) format for commit messages is recommended. PRs will then automatically be added to the next Release Notes and [CHANGELOG](CHANGELOG.md).

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
