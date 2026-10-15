---
agent:
  instruction: Keep this local release-planning probe isolated from production workflows; update its documented evidence limits when scenarios change.
  on-change: "scripts/release-please-proof/**"
---

# Release Please shared-input proof

This probe evaluates Release Please 17.11.2 against Kanagawa Paper's proposed independent Neovim, VS Code, and Zed releases. It is not production release tooling. The ignored consolidation plan is the decision and delivery record.

From the repository root:

```sh
rtk npm ci --prefix scripts/release-please-proof --ignore-scripts --no-audit --no-fund
rtk npm test --prefix scripts/release-please-proof
```

The dependency and transitive dependencies are locked. No credentials are needed. The test uses Release Please's actual manifest configuration parser, commit selection, release strategies, changelog updaters, and combined-PR generation. Only the GitHub repository reads are replaced with in-memory fixtures. Unimplemented SCM operations throw, so the probe cannot create hosted PRs, tags, or releases.

The scenarios assert observed behavior, including failures to meet our desired contract. A passing probe does **not** mean Release Please meets our requirements.

## Results

- Target-local fixes select only their target; multiple candidates combine into one PR with independent versions and changelogs.
- Shared palette fixes/features and releasable root README/LICENSE changes select only the root package. Consumer changelogs omit those shared commits.
- `docs:` alone produces no release by default. Making docs visible through `changelog-sections` produces a root patch release, but still misses consumers.
- Root exclusions suppress extras-only changes and do not suppress a mixed shared-plus-package change. That mixed commit selects only paths it touches.
- `extra-files` is not a shared-input selector.
- `linked-versions` links version numbers and releases unrelated targets for a local fix, contrary to the required independent-version policy.

## Limits

Fixtures start from synchronized release commits with differing package versions. Neovim and Zed use the generic `simple` strategy; VS Code uses `node`. This proves commit routing and PR/changelog generation, not final Zed manifest updating, historical migration, post-merge tag creation, Actions execution, package builds, or Marketplace/registry publication. No custom fan-out plugin is implemented. The probe imports internal modules of the pinned dependency intentionally.

Relevant upstream implementation:

- [Manifest selection and merging](https://github.com/googleapis/release-please/blob/v17.11.2/src/manifest.ts)
- [Path-based commit splitter](https://github.com/googleapis/release-please/blob/v17.11.2/src/util/commit-split.ts)
- [Commit exclusions](https://github.com/googleapis/release-please/blob/v17.11.2/src/util/commit-exclude.ts)
- [Linked versions](https://github.com/googleapis/release-please/blob/v17.11.2/src/plugins/linked-versions.ts)

If the release tool is replaced, remove this probe after its essential evidence has been retained in the delivery record.
