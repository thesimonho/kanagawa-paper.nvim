---
agent:
  instruction: Keep build entry points rooted in this checkout and use isolated outputs; do not restore direct generated-file commits to main.
  on-change: scripts/**
---

# Build and validation commands

`bootstrap.lua` adds the package, shared, and generator runtime roots for isolated Neovim commands. The test runner uses checkout-local `.tests` state. `assemble.py` creates complete application trees under ignored `dist/`; it copies the shared README and license, combines Neovim runtime modules, and invokes the standalone VS Code mapping renderer.

`build.sh` generates the copyable extras. `generate_palette.lua` reads the shared palette directly. Run `just generate` and commit the resulting files with their source change. CI checks for drift instead of pushing generated changes directly to the default branch. Neovim help remains in `packages/neovim/doc` and must be updated when its user-facing contract changes.

`release/` owns release selection and publication. Build output and temporary experiments are disposable. Package tests verify assembled runtime loading, identity, content, and determinism. Release tests use real PSR and local bare Git with fake external publishing to exercise selection and recovery.
