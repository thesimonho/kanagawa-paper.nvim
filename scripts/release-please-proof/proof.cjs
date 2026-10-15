// Exercise the real Release Please planner with an in-memory, read-only SCM.
const assert = require('node:assert/strict');
const { Manifest } = require('release-please/build/src/manifest');
const { setLogger } = require('release-please/build/src/util/logger');
setLogger(Object.fromEntries(['debug', 'info', 'warn', 'error', 'trace'].map(k => [k, () => {}])));

const versions = { '.': '4.1.0', 'packages/vscode': '2.2.1', 'packages/zed': '1.0.0' };
const components = { '.': 'neovim', 'packages/vscode': 'vscode', 'packages/zed': 'zed' };
const baseline = '0'.repeat(40);
const shared = 'lua/kanagawa-paper/colors.lua';
const vscode = 'packages/vscode/src/workbench.lua';
const zed = 'packages/zed/src/theme.lua';
const neovim = 'lua/kanagawa-paper/groups/editor.lua';
const baseConfig = {
  'separate-pull-requests': false,
  'include-component-in-tag': true,
  'include-v-in-tag': false,
  'tag-separator': '-',
  packages: {
    '.': { 'release-type': 'simple', component: 'neovim', 'exclude-paths': ['packages', 'extras', 'targets', 'tests', 'scripts', '.github'] },
    'packages/vscode': { 'release-type': 'node', component: 'vscode' },
    'packages/zed': { 'release-type': 'simple', component: 'zed' },
  },
};

async function plan(changes, config = baseConfig) {
  const files = {
    'release-please-config.json': JSON.stringify(config),
    '.release-please-manifest.json': JSON.stringify(versions),
    'packages/vscode/package.json': JSON.stringify({ name: 'kanagawa-paper', version: versions['packages/vscode'] }),
  };
  const scm = new Proxy({
    repository: { owner: 'fixture', repo: 'kanagawa-paper' },
    async getFileJson(path) {
      assert.ok(path in files, `Unexpected JSON read: ${path}`);
      return JSON.parse(files[path]);
    },
    async getFileContentsOnBranch(path) {
      assert.ok(path in files, `Unexpected file read: ${path}`);
      return { parsedContent: files[path], content: Buffer.from(files[path]).toString('base64'), sha: baseline };
    },
    async *releaseIterator() {
      for (const [path, version] of Object.entries(versions)) {
        yield { tagName: `${components[path]}-${version}`, sha: baseline, notes: '' };
      }
    },
    async *mergeCommitIterator() {
      for (const [index, change] of changes.entries()) {
        yield { sha: String(index + 1).padStart(40, '0'), ...change };
      }
      yield { sha: baseline, message: 'chore: previous releases', files: [] };
    },
  }, {
    get(target, key) {
      assert.ok(key in target, `Unexpected SCM operation: ${String(key)}`);
      return target[key];
    },
  });
  const manifest = await Manifest.fromManifest(scm, 'master');
  const prs = await manifest.buildPullRequests();
  assert.ok(prs.length <= 1, 'Expected at most one combined PR');
  if (!prs.length) return { bumps: {}, notes: {}, prs: 0 };
  const pr = prs[0];
  const update = pr.updates.find(u => u.path === '.release-please-manifest.json');
  const next = JSON.parse(update.updater.updateContent(files['.release-please-manifest.json']));
  const bumps = Object.fromEntries(Object.entries(next).filter(([p, v]) => v !== versions[p]).map(([p, v]) => [components[p], v]));
  const notes = {};
  for (const [path, component] of Object.entries(components)) {
    const changelog = path === '.' ? 'CHANGELOG.md' : `${path}/CHANGELOG.md`;
    const entry = pr.updates.find(u => u.path === changelog);
    if (entry) notes[component] = entry.updater.updateContent('# Changelog\n');
  }
  return { bumps, notes, prs: 1, body: pr.body.toString() };
}

const fix = (file, label = 'fixture fix') => ({ message: `fix: ${label}`, files: [file] });
async function check(name, changes, expected, config, noteChecks = {}) {
  const result = await plan(changes, config);
  assert.deepEqual(result.bumps, expected, name);
  for (const [component, [present, absent]] of Object.entries(noteChecks)) {
    for (const phrase of present) assert.ok(result.notes[component].includes(phrase), `${name}: missing ${phrase}`);
    for (const phrase of absent) assert.ok(!result.notes[component].includes(phrase), `${name}: unexpected ${phrase}`);
  }
  console.log(`PASS ${name}: ${JSON.stringify(result.bumps)} (${result.prs} PR)`);
  return result;
}

(async () => {
  await check('Neovim-only', [fix(neovim)], { neovim: '4.1.1' });
  await check('VS Code-only', [fix(vscode)], { vscode: '2.2.2' });
  await check('Zed-only', [fix(zed)], { zed: '1.0.1' });
  await check('shared palette fix misses consumers', [fix(shared)], { neovim: '4.1.1' });
  await check('shared feature misses consumers', [{ message: 'feat: shared accent', files: [shared] }], { neovim: '4.2.0' });
  await check('root README releasable fix misses consumers', [fix('README.md')], { neovim: '4.1.1' });
  await check('shared LICENSE releasable fix misses consumers', [fix('LICENSE')], { neovim: '4.1.1' });
  await check('docs alone follows default no-release policy', [{ message: 'docs: shared guide', files: ['README.md'] }], {});
  await check('excluded extras fix', [fix('extras/ghostty/theme')], {});
  await check('mixed commit remains root-relevant', [{ message: 'fix: shared and vscode', files: [shared, vscode] }], { neovim: '4.1.1', vscode: '2.2.2' });

  const combined = await check('combined PR with independent changelogs', [fix(neovim, 'nvim-local'), fix(vscode, 'vscode-local'), fix(zed, 'zed-local'), fix(shared, 'shared-selection')],
    { neovim: '4.1.1', vscode: '2.2.2', zed: '1.0.1' }, undefined, {
      neovim: [['nvim-local', 'shared-selection'], ['vscode-local', 'zed-local']],
      vscode: [['vscode-local'], ['shared-selection', 'nvim-local', 'zed-local']],
      zed: [['zed-local'], ['shared-selection', 'nvim-local', 'vscode-local']],
    });
  assert.ok(combined.body.includes('4.1.1') && combined.body.includes('2.2.2') && combined.body.includes('1.0.1'));

  const visibleDocs = structuredClone(baseConfig);
  visibleDocs['changelog-sections'] = [{ type: 'docs', section: 'Documentation', hidden: false }, { type: 'fix', section: 'Fixes', hidden: false }];
  await check('configured docs policy still misses consumers', [{ message: 'docs: shared guide', files: ['README.md'] }], { neovim: '4.1.1' }, visibleDocs);

  const extraFiles = structuredClone(baseConfig);
  extraFiles.packages['packages/vscode']['extra-files'] = ['/README.md'];
  await check('extra-files is not an input selector', [fix('README.md')], { neovim: '4.1.1' }, extraFiles);

  const linked = structuredClone(baseConfig);
  linked.plugins = [{ type: 'linked-versions', groupName: 'theme', components: ['neovim', 'vscode', 'zed'] }];
  await check('linked versions wrongly releases all for a local fix', [fix(neovim)], { neovim: '4.1.1', vscode: '4.1.1', zed: '4.1.1' }, linked);
  console.log('\nAll observations verified. Stock path-based selection FAILS the required shared-input fan-out contract.');
})().catch(error => { console.error(error); process.exitCode = 1; });
