[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />

<p align="center">
  <h1 align="center">nvdev</h1>
  <p align="center">
    An incredibly optimized and fully featured neovim development environment ~ 0.05s startup
    <br />
    <br />
    <a href="https://github.com/chinarjoshi/nvdev/issues">Report Bug</a>
    ·
    <a href="https://github.com/chinarjoshi/nvdev/issues">Request Feature</a>
  </p>
</p>

## Quick Pitch

 1. **Leader Mappings**
  - Cleverly thought out with hotkeys for common functions (e.g. \<SPC>\<SPC> to search project files) and two letters for less common functions (e.g. <SPC>tn to make new tab)
  - Phonetic behavior since first letter of function is always the mapping (Search TODO-list becomes <SPC>st)
  - Covers all common usage for both vim features and plugin features

 2. **Completeness**: Contains *all* the functionality you need from an IDE with 43 plugins that are fully configured and performant

 3. **Minimal Abstraction**: Uses an idiomatic and straightforward configuration structure to make further configuration easy to add

 4. **Speed**: Fully written in lua, and the number of plugins hardly matters since (almost) all plugins are lazy loaded on commands/events/load order

## Benchmarking

```bash
❯ time nvim mappings.lua +q
nvim mappings.lua +q  0.05s user 0.03s system 102% cpu 0.074 total
```

```bash
❯ nvim mappings.lua --startuptime vim.log
❯ tail -n3 vim.log
063.360  000.583: before starting main loop
067.368  004.008: first screen update
067.370  000.002: --- NVIM STARTED ---
```

## Installation

Clone nvdev into your neovim configuration folder, and then call PackerSync to install all plugins

```bash
git clone https://github.com/chinarjoshi/nvdev ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
```

## Configuration Structure
`~/.config/nvim`
```
├── lua
│   ├── core
│   │   ├── highlights.lua
│   │   ├── init.lua
│   │   ├── mappings.lua
│   │   ├── settings.lua
│   │   ├── utils.lua
│   └── plugins
│       ├── configs
│       │   ├── cmp.lua
│       │   ├── colors.lua
│       │   ├── icons.lua
│       │   ├── indent-blankline.lua
│       │   ├── lspconfig.lua
│       │   ├── lspkind_icons.lua
│       │   ├── null_ls.lua
│       │   ├── nvimtree.lua
│       │   ├── others.lua
│       │   ├── statusline.lua
│       │   ├── telescope.lua
│       │   ├── treesitter.lua
│       │   ├── which-key.lua
│       │   └── windows.lua
│       ├── init.lua
│       └── packer.lua
└── init.lua

4 directories, 22 files
```

### Files
`/nvim`
 * [init.lua](nvim/init.lua): Loads settings, mappings, and sets up plugins
 * [lua](nvim/lua): Folder containing lua modules

`/nvim/lua/core`
 * [highlights.lua](nvim/lua/highlights.lua): Highlights for nvim and plugin ui's
 * [init.lua](nvim/lua/init.lua): Initial setup file that calls all plugins for lazy loading purposes
 * [settings.lua](nvim/lua/settings.lua): Sets editor options, defines autocommands, and disables builtin plugins
 * [utils.lua](nvim/lua/utils.lua): A few utility functions and quick variables to change

`/nvim/lua/plugins`
 * [init.lua](nvim/lua/init.lua): (**IMPORTANT**) List of managed plugins and lazy loaders
 * [packer.lua](nvim/lua/packer.lua): Packer.nvim initialization and requires all config files
 * [configs](nvim/lua/configs): Folder containing plugin-specific config

`/nvim/lua/configs`
 * [cmp.lua](nvim/lua/configs/cmp.lua): Autocompletion
 * [colors.lua](nvim/lua/configs/colors.lua): Theme and RGB colorizer
 * [icons.lua](nvim/lua/configs/icons.lua): Custom devicons
 * [indent-blankline.lua](nvim/lua/configs/indent-blankline.lua): Indent line
 * [lspconfig.lua](nvim/lua/configs/lspconfig.lua): LSP and installer configuration
 * [null-ls.lua](nvim/lua/configs/null-ls.lua): Adapter for command line formatters/linters
 * [nvim-tree](nvim/lua/configs/nvim-tree.lua): File tree
 * [others.lua](nvim/lua/configs/others.lua): All other plugin setup
 * [feline.lua](nvim/lua/configs/feline.lua): Statusline
 * [telescope.lua](nvim/lua/configs/telescope.lua): Fuzzy finder
 * [treesitter.lua](nvim/lua/configs/treesitter.lua): Treesitter interface
 * [which-key.lua](nvim/lua/configs/which-key.lua): Help for leader key mappings
 * [windows.lua](nvim/lua/configs/windows.lua): Window and split based plugins

## Plugin List

### Base
 * packer.nvim
 * nvim-treesitter
 * nvim-tree
 * telescope.nvim
 * nvim-cmp (+ Sources)
 * LuaSnip
 * project.nvim
 * which-key.nvim
 * impatient.nvim
 * plenary.nvim
 * filetype.nvim

### LSP
 * nvim-lspconfig
 * null-ls.nvim
 * lsp\_signature.nvim
 * lsp-colors.nvim
 * trouble.nvim
 * lspkind-nvim

### Editing
 * lightspeed.nvim
 * vim-surround
 * vim-commentary
 * vim-repeat
 * todo-comments.nvim

### Windows and splits
 * nvim-window
 * focus.nvim
 * winshift.nvim
 * luatab.nvim

### Aesthetic
 * nvim-base16.lua
 * feline.nvim
 * nvim-web-devicons
 * nvim-colorizer

### Etc.
 * neogit
 * gitsigns.nvim
 * nvim-autopairs
 * toggleterm.nvim
 * indent-blankline.nvim
 * orgmode
 * vista.vim
 * glow.nvim
 * iswap.nvim
 * vim-matchup
 * sniprun


## Gallery
<p align="center">Front view:</p>
<p align="center">
  <a href="https://github.com/chinarjoshi/visual-aid-transducer">
    <img src="Visual/Front.PNG" alt="example-image" width=875 height=500>
  </a>
</p>

## Inspirations

## TODO

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/chinarjoshi/visual-aid-transducer?style=for-the-badge
[contributors-url]: https://github.com/chinarjoshi/visual-aid-transducer/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/chinarjoshi/visual-aid-transducer?style=for-the-badge
[forks-url]: https://github.com/chinarjoshi/visual-aid-transducer/network/members
[stars-shield]: https://img.shields.io/github/stars/chinarjoshi/visual-aid-transducer?style=for-the-badge
[stars-url]: https://github.com/chinarjoshi/visual-aid-transducer/stargazers
[issues-shield]: https://img.shields.io/github/issues/chinarjoshi/visual-aid-transducer?style=for-the-badge
[issues-url]: https://github.com/chinarjoshi/visual-aid-transducer/issues
[license-shield]: https://img.shields.io/github/license/chinarjoshi/visual-aid-transducer?style=for-the-badge
[license-url]: https://github.com/chinarjoshi/visual-aid-transducer/blob/master/LICENSE
