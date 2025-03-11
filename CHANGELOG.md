# Changelog

## [2.0.1](https://github.com/thesimonho/kanagawa-paper.nvim/compare/v2.0.0...v2.0.1) (2025-03-11)


### Bug Fixes

* **cache:** correct scope for encapsulation pattern ([#29](https://github.com/thesimonho/kanagawa-paper.nvim/issues/29)) ([76633c3](https://github.com/thesimonho/kanagawa-paper.nvim/commit/76633c3035aa4c626b00b4487048077786c271d8))
* **editor:** keep syntax colors on visual selections ([1afb15d](https://github.com/thesimonho/kanagawa-paper.nvim/commit/1afb15de43b6c25930f56eda948c7b4d15906037))
* **ink:** create better distinction between visual and cursorline ([027aa65](https://github.com/thesimonho/kanagawa-paper.nvim/commit/027aa6587b08d9af31cdd38f99a39ccc0ebc1669))
* **theme:** add additional cursorline group ([9061ac5](https://github.com/thesimonho/kanagawa-paper.nvim/commit/9061ac50a57a6c5c72b5b26ad3597fc12d80a285))

## [2.0.0](https://github.com/thesimonho/kanagawa-paper.nvim/compare/v1.8.0...v2.0.0) (2025-03-08)


### ⚠ BREAKING CHANGES

* **config:** rename config options for consistency
* **pywal:** remove pywal extra
* **fish:** remove fish extra
* add ability to choose plugin themes to apply

### Features

* add ability to choose plugin themes to apply ([72a85ab](https://github.com/thesimonho/kanagawa-paper.nvim/commit/72a85abca725111b33d916abce5400e567493062))
* **alacritty:** add template for alacritty extra ([a8d59a1](https://github.com/thesimonho/kanagawa-paper.nvim/commit/a8d59a1e8081a064e60bc58d3caa2eb53f713fab))
* **canvas:** add canvas palette ([524683a](https://github.com/thesimonho/kanagawa-paper.nvim/commit/524683ad8d13069a0b484e13dec3cfb9bc12625d))
* **config:** add brightness offset option ([0429b5f](https://github.com/thesimonho/kanagawa-paper.nvim/commit/0429b5fae555bf4bee497193f96657a1cd6982b6))
* **config:** add option to enable/disable background for virtual text ([71206ee](https://github.com/thesimonho/kanagawa-paper.nvim/commit/71206ee3f4e9b5ba7913f3574628ce5202821dc7))
* **config:** add saturation offset option ([10075f0](https://github.com/thesimonho/kanagawa-paper.nvim/commit/10075f02e2c5315503614aa211a4871325c2594c))
* **config:** add theme caching option ([bd5b271](https://github.com/thesimonho/kanagawa-paper.nvim/commit/bd5b2714852c6c6113ba3f63dc8622b9d38eece3))
* **config:** auto plugin loading option for lazy.nvim ([c19ce6f](https://github.com/thesimonho/kanagawa-paper.nvim/commit/c19ce6f475252eeb9a87ab84b48208f068941b7d))
* **editor:** add highlight for examples in help files ([ff004f1](https://github.com/thesimonho/kanagawa-paper.nvim/commit/ff004f192dd15631981b7ab595aa8084fea787e6))
* **extras:** add build process for extras ([ed1119a](https://github.com/thesimonho/kanagawa-paper.nvim/commit/ed1119a9841b04782e31b1673922cfd228b34286))
* **fish:** remove fish extra ([3e465db](https://github.com/thesimonho/kanagawa-paper.nvim/commit/3e465db0f33bee501135e03bdcb745f1b592d0f1))
* **fzf:** add template for fzf extra ([f1a86cf](https://github.com/thesimonho/kanagawa-paper.nvim/commit/f1a86cff532e89c3a8c79f37c44828fb39a28b6d))
* **ghostty:** add template for ghostty theme ([8306edb](https://github.com/thesimonho/kanagawa-paper.nvim/commit/8306edbee319320de020300eb6f634239c0cb89b))
* **ink:** set scrollbar to shade of the bg ([4c34918](https://github.com/thesimonho/kanagawa-paper.nvim/commit/4c349188c0876b020c08753ee2d9ab38a83a9327))
* **ink:** use brightened colors for bright ansi colors ([b2a8360](https://github.com/thesimonho/kanagawa-paper.nvim/commit/b2a8360b73d913f8a1c008e78b0ce9c6fee55591))
* **kitty:** add template for kitty extra ([191a5dc](https://github.com/thesimonho/kanagawa-paper.nvim/commit/191a5dc9f3d3eefc13f315ebdd977d7dde2503b3))
* **lazygit:** add template for lazygit extra ([c8b7cdf](https://github.com/thesimonho/kanagawa-paper.nvim/commit/c8b7cdf0b488bed83e24cb664c7d5120e55fd7af))
* **lsp:** using bg highlight for lspreferences ([89f65b7](https://github.com/thesimonho/kanagawa-paper.nvim/commit/89f65b7b9c0b8751318d7e98d58a9a7218afe3ce))
* **pywal:** remove pywal extra ([4c98a06](https://github.com/thesimonho/kanagawa-paper.nvim/commit/4c98a06c10962ede0f64c483c80c7fcb1702d38a))
* **terminal:** add template for windows terminal extra ([1524591](https://github.com/thesimonho/kanagawa-paper.nvim/commit/15245916aabae33ff060c66275eca1f17979f5d1))
* **terminator:** add template for terminator extra ([2f191bf](https://github.com/thesimonho/kanagawa-paper.nvim/commit/2f191bf69dafbf3f5100ad9ffbea631ca4147218))
* **termux:** add template for termux extra ([e9761e1](https://github.com/thesimonho/kanagawa-paper.nvim/commit/e9761e1dd31efca8fd82bb1713f9a9ba1099e1c3))
* **theme:** add default lotus colors ([aa96c99](https://github.com/thesimonho/kanagawa-paper.nvim/commit/aa96c99b85201505311d3d56c043c3b8f4b5a597))
* **theme:** add theme switching ([2220c56](https://github.com/thesimonho/kanagawa-paper.nvim/commit/2220c56a61093e51fe22be0ccfaeac3e25bf4824))
* **theme:** create new accent color ([651acd8](https://github.com/thesimonho/kanagawa-paper.nvim/commit/651acd83e524d9d8bcdddfce77c6c80a18e2e546))
* **tilix:** add template for tilix extra ([b246761](https://github.com/thesimonho/kanagawa-paper.nvim/commit/b24676178ccbd3470daca2543f5c272c56277e67))
* **utils:** add utils lib and hot reload for palette ([ed1119a](https://github.com/thesimonho/kanagawa-paper.nvim/commit/ed1119a9841b04782e31b1673922cfd228b34286))
* **vscode_terminal:** add template for vscode terminal extra ([d8942ed](https://github.com/thesimonho/kanagawa-paper.nvim/commit/d8942eddd628e3da7c833b78fa79240e73b00bc4))
* **wezterm_tabline:** add template for wezterm tabline plugin ([bdd93df](https://github.com/thesimonho/kanagawa-paper.nvim/commit/bdd93df0f430f938cd62f740e283d41e71f25591))
* **wezterm:** add wezterm integration to auto switch the theme ([bd51421](https://github.com/thesimonho/kanagawa-paper.nvim/commit/bd514210dcfef8af4629fb02561420212e7923db))
* **wezterm:** add wezterm template ([66bae38](https://github.com/thesimonho/kanagawa-paper.nvim/commit/66bae38175261db0df9a0e5e6be397346e72f7b8))


### Bug Fixes

* **canvas:** bolder colors ([e7c9255](https://github.com/thesimonho/kanagawa-paper.nvim/commit/e7c92555efe43521add43da0975784e14e0707ca))
* **canvas:** improve indent colors ([e7c9255](https://github.com/thesimonho/kanagawa-paper.nvim/commit/e7c92555efe43521add43da0975784e14e0707ca))
* **canvas:** reduce saturation of canvas colors ([0449f68](https://github.com/thesimonho/kanagawa-paper.nvim/commit/0449f68a7963cb82571bb042a3f6e4d9fba2632c))
* **config:** fix theme overrides for multiple themes ([ad35e0e](https://github.com/thesimonho/kanagawa-paper.nvim/commit/ad35e0ec1a8a85eacb4f48384011fee4fc8113e2))
* **config:** rename config options for consistency ([908f6a9](https://github.com/thesimonho/kanagawa-paper.nvim/commit/908f6a905cd103cb77f76f5c2e2e4b733b03e81a))
* **dev:** fix colour indicators during dev mode ([ed1119a](https://github.com/thesimonho/kanagawa-paper.nvim/commit/ed1119a9841b04782e31b1673922cfd228b34286))
* **editor:** add fg color to visual selections so they're easier to read ([03969da](https://github.com/thesimonho/kanagawa-paper.nvim/commit/03969da8b17a1d47b1c630a96c0654c54e033322))
* **extras:** building with the wrong theme field ([52e7781](https://github.com/thesimonho/kanagawa-paper.nvim/commit/52e7781985f1c3ca82a6a69336e7b16bddd670e6))
* **extras:** set execute permissions ([c8ab889](https://github.com/thesimonho/kanagawa-paper.nvim/commit/c8ab889933cdc96e9b2e0c613c71187f0ce1c0dd))
* **float:** make float and pemu colors more consistent across themes ([d7be442](https://github.com/thesimonho/kanagawa-paper.nvim/commit/d7be44294f58c96759e68377d395e52248103918))
* **ink:** make diag backgrounds brighter ([3c386ad](https://github.com/thesimonho/kanagawa-paper.nvim/commit/3c386ad2993fb0b9f9acf4e9a0263da53965f6f2))
* **ink:** make gray more readable ([660e70d](https://github.com/thesimonho/kanagawa-paper.nvim/commit/660e70d33355a34c98c2344a53a2d5700d872258))
* **lazy:** fix consistency of lazy buttons ([5983df2](https://github.com/thesimonho/kanagawa-paper.nvim/commit/5983df26b5afb7abcf131c29e5f110a67f28ab60))
* **lsp:** make inlays and refs more subtle ([57363b5](https://github.com/thesimonho/kanagawa-paper.nvim/commit/57363b53976eec468f925cef803d5419e5b17977))
* **lsp:** unset lsp comment fg to allow TODO notes to show up correctly ([dd3a8d8](https://github.com/thesimonho/kanagawa-paper.nvim/commit/dd3a8d88df800277e1828dc70b90ca993ccc4a7f))
* **lualine:** add default theme for backward compat ([5ab4d0d](https://github.com/thesimonho/kanagawa-paper.nvim/commit/5ab4d0d6d0db19e15071c4d63a69489d14307ffd))
* **neotree:** make colors more distinctive ([fe859eb](https://github.com/thesimonho/kanagawa-paper.nvim/commit/fe859eb835d4cf2db7d2ac23ef23be10ab7cedf2))
* **noice:** fix command line search text readability ([b66f6fc](https://github.com/thesimonho/kanagawa-paper.nvim/commit/b66f6fc5fd331186483402432eb73ae7c91ceb53))
* **tabline:** make tabline colors easier to read ([9e93947](https://github.com/thesimonho/kanagawa-paper.nvim/commit/9e93947b4fc7bec733e8beaa6f2f18b55050aaac))
* **telescope:** add missing hlgroups ([917dcb8](https://github.com/thesimonho/kanagawa-paper.nvim/commit/917dcb84f9d72cfb59ad2c92d1d96af19e4fc292))
* **theme:** fix background changing behavior of static themes ([846941f](https://github.com/thesimonho/kanagawa-paper.nvim/commit/846941f54597f1864e932d5d48be16fbd70f1c9d))
* **theme:** fix dynamic theme loading ([67101b9](https://github.com/thesimonho/kanagawa-paper.nvim/commit/67101b9fbccd2f5d91c6d584925c7cdd13c3ef0f))
* **theme:** set relative light and dark colors for diag ([1c7c7e5](https://github.com/thesimonho/kanagawa-paper.nvim/commit/1c7c7e552711014294a01ccfb6e6abbe3888528b))
* **theme:** use blend for diag backgrounds ([d3dad2b](https://github.com/thesimonho/kanagawa-paper.nvim/commit/d3dad2b25b64450bef23e857c145d13e4110a96f))
* **treesitter_context:** fix line number coloring ([45ba977](https://github.com/thesimonho/kanagawa-paper.nvim/commit/45ba977cb9ff0fcd50e6c62b7959315c2f631de6))
* **treesitter:** standardize markdown headers on rainbow ([84511f2](https://github.com/thesimonho/kanagawa-paper.nvim/commit/84511f202e5427528f53ac26cf06d1b14302befa))
* **ts-context:** improve style of context window ([793dbbd](https://github.com/thesimonho/kanagawa-paper.nvim/commit/793dbbd14c48642a4ae2a8a7b56961f0b0091f15))
* **vcs:** use new vcs colors instead of base groups ([f5ab058](https://github.com/thesimonho/kanagawa-paper.nvim/commit/f5ab058de5b9b7020a10cf4646c48f29131ae4e4)), closes [#25](https://github.com/thesimonho/kanagawa-paper.nvim/issues/25)
* **wezterm_tabline:** add tab colors ([fed9212](https://github.com/thesimonho/kanagawa-paper.nvim/commit/fed9212989af02884cb5815c11c672ecc51aa195))
* **wezterm_tabline:** fix section A fg color ([bdd93df](https://github.com/thesimonho/kanagawa-paper.nvim/commit/bdd93df0f430f938cd62f740e283d41e71f25591))
* **yanky:** match yank highlight to visual selection color for consistency ([5b3327b](https://github.com/thesimonho/kanagawa-paper.nvim/commit/5b3327b91cc11fa94a949300fc4a1391eaf956d6))


### Performance Improvements

* **groups:** use simpler api for listing directory files ([49b7a23](https://github.com/thesimonho/kanagawa-paper.nvim/commit/49b7a23197157c2122030acfa711187d886f36c1))
* **lib:** cache common function calls ([c63eeb5](https://github.com/thesimonho/kanagawa-paper.nvim/commit/c63eeb54c127e2cc08c9b0801a23361442a12fd1))
* **plugins:** add cache for plugin lookup ([0095456](https://github.com/thesimonho/kanagawa-paper.nvim/commit/0095456027c0474f0659b8c669ba4c7e6ce7b971))

## [1.8.0](https://github.com/thesimonho/kanagawa-paper.nvim/compare/v1.7.0...v1.8.0) (2025-02-08)


### Features

* **blink:** add additional blink highlights ([a38356b](https://github.com/thesimonho/kanagawa-paper.nvim/commit/a38356b6520fadd710116352e9e98406c9e171c1))
* **blink:** add highlights for blink completion ([79bdc98](https://github.com/thesimonho/kanagawa-paper.nvim/commit/79bdc98ffdadaf5a9536a6fa108d3fcb235228ed))
* **extras:** add ghostty ([0aee289](https://github.com/thesimonho/kanagawa-paper.nvim/commit/0aee2893f0178fb7078b4c6e51fd780d64b046d4))
* **lsp:** add additional lsp types ([ec651cb](https://github.com/thesimonho/kanagawa-paper.nvim/commit/ec651cb118a2e5671b1f148a9e432f09e7bda7c3))
* **palette:** add darker sumiInk color ([dca5578](https://github.com/thesimonho/kanagawa-paper.nvim/commit/dca55783f2e4b847ba064370c61d877fd0a62cde))


### Bug Fixes

* **blink:** make source text more readable ([502cd71](https://github.com/thesimonho/kanagawa-paper.nvim/commit/502cd718eec01bb9fd6cbbd12bc6508f07ce1312))
* **dap:** make breakpoints and UI buttons more readable ([bf4a8a9](https://github.com/thesimonho/kanagawa-paper.nvim/commit/bf4a8a986cbc8f5c193adb2ed0cd2970f672040f))
* **lualine:** set the correct statusline color ([8da902e](https://github.com/thesimonho/kanagawa-paper.nvim/commit/8da902efd40818ec96d6881597efb60222a1c469))
* **lualine:** use darker color for inactive statusline ([108f0f5](https://github.com/thesimonho/kanagawa-paper.nvim/commit/108f0f52539a8c068796f277d1219f3d89a80960))
* **noice:** match cmdline search text to match color ([4abc704](https://github.com/thesimonho/kanagawa-paper.nvim/commit/4abc704f0f1ab68c8e10e5169ea7c4676b3adadf))
* **snacks:** set color for indents ([74f9110](https://github.com/thesimonho/kanagawa-paper.nvim/commit/74f911042c9901d8556fa7a5093912126cb3db2a))
* **treesitter:** set underline color ([63e61fd](https://github.com/thesimonho/kanagawa-paper.nvim/commit/63e61fdc784dc5a13e2301a60d354a0ce58a0096))
* **treesitter:** use underline for urls ([728081f](https://github.com/thesimonho/kanagawa-paper.nvim/commit/728081fe096c645a937a7784e6cbf73ec1b97d83))
* **trouble:** make trouble counts more readable ([21c86a4](https://github.com/thesimonho/kanagawa-paper.nvim/commit/21c86a44e7294526d4f65394c997b5c60280ea73))

## [1.7.0](https://github.com/sho-87/kanagawa-paper.nvim/compare/v1.6.0...v1.7.0) (2024-12-03)


### Features

* **fzf:** add color scheme for fzf ([c510f4c](https://github.com/sho-87/kanagawa-paper.nvim/commit/c510f4c6461f00753ff0c03e68e368eb6ba217e1)), closes [#17](https://github.com/sho-87/kanagawa-paper.nvim/issues/17)


### Bug Fixes

* **diff:** make changed diff text more readable ([a3a6320](https://github.com/sho-87/kanagawa-paper.nvim/commit/a3a6320997a022b3546f62335b6442853fc76191))
* **extras:** make wezterm highlights more readable ([ca32d10](https://github.com/sho-87/kanagawa-paper.nvim/commit/ca32d10d59d73f5fee728b9e03bb88e966e5ca18))
* **neogit:** use default neogit colors for diffs ([2856b25](https://github.com/sho-87/kanagawa-paper.nvim/commit/2856b250977c3c7a30f10019a82328f660a7f730)), closes [#18](https://github.com/sho-87/kanagawa-paper.nvim/issues/18)

## [1.6.0](https://github.com/sho-87/kanagawa-paper.nvim/compare/v1.5.0...v1.6.0) (2024-10-12)


### Features

* add hl for markdown.nvim headers ([c1fac34](https://github.com/sho-87/kanagawa-paper.nvim/commit/c1fac349097dab206f1bf8481976bdb89bba995c))
* **barbar:** fix background when using transparent theme ([e264574](https://github.com/sho-87/kanagawa-paper.nvim/commit/e2645741fd9f6ec7da149135e181a70bc3725ad6))
* **extras:** add color overrides for wezterm tabline ([66053e5](https://github.com/sho-87/kanagawa-paper.nvim/commit/66053e59a7e28cb9e8df542c41f588acebec223e))
* **grug-far:** add hl for grug-far ([197f0e8](https://github.com/sho-87/kanagawa-paper.nvim/commit/197f0e83876997be12aaedf20d7c608c3a469daa))


### Bug Fixes

* **barbar:** fix bolding of a few elements ([07d9685](https://github.com/sho-87/kanagawa-paper.nvim/commit/07d9685e9e1724bb30d543959c8ccf2432e4f2bc))
* **editor:** differentiate cursorline and visual selection colors ([1a4909c](https://github.com/sho-87/kanagawa-paper.nvim/commit/1a4909caf86013280226a8391391e44ff3fe35e4)), closes [#14](https://github.com/sho-87/kanagawa-paper.nvim/issues/14)
* **editor:** winbar typo ([5067fa5](https://github.com/sho-87/kanagawa-paper.nvim/commit/5067fa5a27c57bfee29cb2c4099933da3bb12707))
* **headlines:** reduce brightness of markdown header bg ([341adbe](https://github.com/sho-87/kanagawa-paper.nvim/commit/341adbef7b9ca09a3290fa855932ef8594c931bb))
* **indent:** make indent lines brighter ([71b3360](https://github.com/sho-87/kanagawa-paper.nvim/commit/71b33609ec2b782921c763054a37472b507c1e43))
* **lsp:** remove inlay and codelens bg for transparent themes ([e7eb180](https://github.com/sho-87/kanagawa-paper.nvim/commit/e7eb180bfd776fe41dba613fe19fbc6ff7229484))
* **lsp:** tweak some LSP colors (inlayhints, modules) ([5969bfa](https://github.com/sho-87/kanagawa-paper.nvim/commit/5969bfa1b0e464ddc87f4f1b788b89103245a7cb))
* **markdown:** fix header colors ([cb5b597](https://github.com/sho-87/kanagawa-paper.nvim/commit/cb5b5978654651d37d22066c9b59d2a38489bc36))
* **markdown:** remove underline from markdown links ([4376cd2](https://github.com/sho-87/kanagawa-paper.nvim/commit/4376cd26f43b5b8ddf58f25b3908347b34754e09))
* **vcs:** add darker diff colors ([928f0f4](https://github.com/sho-87/kanagawa-paper.nvim/commit/928f0f4f28475111d0b507c27b243744648bac1f))

## [1.5.0](https://github.com/sho-87/kanagawa-paper.nvim/compare/v1.4.1...v1.5.0) (2024-07-15)


### Features

* **gitgutter:** add hl for gitgutter ([5c8095c](https://github.com/sho-87/kanagawa-paper.nvim/commit/5c8095c1fba5f133810e70926ede58620474c879))
* **indent:** add hl for indent line character ([06bc994](https://github.com/sho-87/kanagawa-paper.nvim/commit/06bc994416ea2a503a3a171f2fff929f9b12c623))
* **neotest:** add hl for neotest ([3407e75](https://github.com/sho-87/kanagawa-paper.nvim/commit/3407e75ab67131dcd0045a9a3854e429de9fff19))
* **octo:** add hl for octo ([94954b6](https://github.com/sho-87/kanagawa-paper.nvim/commit/94954b6e6771e381ba85a8f21597eaa8d6403d8e))
* **overseer:** add hl for overseer ([8a40bf2](https://github.com/sho-87/kanagawa-paper.nvim/commit/8a40bf2cb9d81af1c036de378beb04417280e3e2))
* **rainbow:** add hl for rainbow ([8858669](https://github.com/sho-87/kanagawa-paper.nvim/commit/8858669f93a9b66c44d5734e0b7283bfa747cc0a))
* **which-key:** add hl for the title ([05c0e0b](https://github.com/sho-87/kanagawa-paper.nvim/commit/05c0e0b02d75254dc7ccadb06caff48ae6b67177))
* **windowpicker:** add hl for window picker letter ([bbf1a7b](https://github.com/sho-87/kanagawa-paper.nvim/commit/bbf1a7b1d3a0b7eb61d69c371401e59062f31f55))


### Bug Fixes

* **yanky:** link highlights to visual and insert mode colors ([66596b9](https://github.com/sho-87/kanagawa-paper.nvim/commit/66596b9260b17542e5f7eb6faf7b27f044970b77))
