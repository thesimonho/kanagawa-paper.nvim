#!/bin/bash
set -euo pipefail

# This is the approved post-merge automation exception to direct main pushes.
[[ "$(git branch --show-current)" == main ]] || { echo "Generation publication requires main" >&2; exit 1; }
[[ -z "$(git status --porcelain)" ]] || { echo "Generation publication requires a clean checkout" >&2; exit 1; }

bash scripts/build.sh
nvim --headless --clean -l scripts/generate_palette.lua

# Extras are ignored for local development, so include newly generated files too.
git add -f -- extras/ palette_colors.md
if git diff --cached --quiet; then
    exit 0
fi

git -c user.name='github-actions[bot]' \
    -c user.email='41898282+github-actions[bot]@users.noreply.github.com' \
    commit -m 'chore: refresh generated extras and palette'
# Reject a concurrent source update. Its queued workflow regenerates from that
# newer source; never force push or rebase outputs made from an older snapshot.
git push origin HEAD:refs/heads/main
