---
agent:
  instruction: Keep build entry points rooted in this checkout and use isolated outputs; restrict direct main writes to the approved post-merge generated-file publisher.
  on-change: scripts/**
---

# Build and validation commands

`bootstrap.lua` adds the package, shared, and generator runtime roots for isolated Neovim commands. The test runner uses checkout-local `.tests` state. `assemble.py` creates complete application trees under ignored `dist/`; it copies the shared README and license, combines Neovim runtime modules, and invokes the standalone VS Code mapping renderer.

`build.sh` generates the copyable extras. `generate_palette.lua` reads the shared palette directly. PR validation runs both generators, including for forks, without requiring their output to be committed. After merge, the serialized default-branch workflow runs `publish-generated.sh` before release coordination. It commits only extras and palette output directly to main, as the user-approved automation exception. Newly generated ignored extras are included; unchanged output creates no commit. A concurrent source push is rejected rather than overwritten, and its queued workflow regenerates from the latest source. `just generate` is an optional local preview. Neovim help remains in `packages/neovim/doc` and must be updated when its user-facing contract changes.

`release/` owns release selection and publication. Build output and temporary experiments are disposable. Package tests verify assembled runtime loading, identity, content, and determinism. Release tests use real PSR and local bare Git with fake external publishing to exercise selection and recovery.
