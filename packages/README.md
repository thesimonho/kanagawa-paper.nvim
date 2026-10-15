---
agent:
  instruction: Preserve application identity and versions; package only assembled trees, with the root README and license.
  on-change: "packages/**"
---

# Application packages

`neovim/` contains runtime integration, highlight mappings, and its historical changelog. Shared modules are supplied by `shared/` during development and copied into the installed runtime by `scripts/assemble.py`.

`vscode/` preserves the `SimonHo.kanagawa-paper` extension identity and version history. Its mapping JSON uses `@palette.name` or `@theme.section.role`; append `:80` for alpha. Literal colors are explicit application-specific choices, including the existing Canvas tuning. The renderer fails on unresolved references. Do not manually edit assembled theme JSON.

The maintained user README and license live at the repository root and are copied into both distributions. Application source directories are not installable artifacts. Run `python3 scripts/assemble.py` to create `dist/neovim` and `dist/vscode`.
