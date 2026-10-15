---
agent:
  instruction: Keep shared palette and roles loadable without Neovim package configuration; preserve runtime module names.
  on-change: "shared/**"
---

# Shared theme data

`lua/kanagawa-paper/palette.lua` owns named colors. `themes/ink.lua` and `themes/canvas.lua` own semantic roles. Their only option is `gutter`; application configuration stays in its package. `lib/color.lua` and `lib/hsluv.lua` provide color calculations.

Neovim loads these modules directly during development. Assembly copies them into its runtime tree. The VS Code renderer resolves references from these same modules without loading the Neovim plugin. Keep the `kanagawa-paper` namespace so the project-local reload command clears shared modules too.
