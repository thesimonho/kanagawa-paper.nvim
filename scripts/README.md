---
agent:
  instruction: Keep build entry points rooted in this checkout and use isolated outputs; do not restore direct generated-file commits to main.
  on-change: scripts/**
---

# Build and validation commands

`bootstrap.lua` adds the package, shared, and generator runtime roots for isolated Neovim commands. The test runner uses checkout-local `.tests` state. `assemble.py` creates complete application trees under ignored `dist/`; it copies the shared README and license, combines Neovim runtime modules, and invokes the standalone VS Code mapping renderer.

`build.sh` generates the copyable extras. `generate_palette.lua` reads the shared palette directly. For same-repository pull requests, CI generates these files and commits changes to the PR branch before validation. The deploy key triggers a fresh validation run on that commit; unchanged output produces no commit. CI never pushes generated files to the default branch. `just generate` is an optional local preview, not a delivery requirement. Fork pull requests run read-only validation; a maintainer must move changes needing generation to a repository branch so automation can update them. Neovim help remains in `packages/neovim/doc` and must be updated when its user-facing contract changes.

`release/` owns release selection and publication. Build output and temporary experiments are disposable. Package tests verify assembled runtime loading, identity, content, and determinism. Release tests use real PSR and local bare Git with fake external publishing to exercise selection and recovery.
