-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', { 'nvim-0.5' }) ~= 1 then
  vim.api.nvim_command 'echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"'
  return
end

vim.api.nvim_command 'packadd packer.nvim'

local no_errors, error_msg = pcall(function()
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end

  local function save_profiles(threshold)
    local sorted_times = {}
    for chunk_name, time_taken in pairs(profile_info) do
      sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
    end
    table.sort(sorted_times, function(a, b)
      return a[2] > b[2]
    end)
    local results = {}
    for i, elem in ipairs(sorted_times) do
      if not threshold or threshold and elem[2] > threshold then
        results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
      end
    end

    _G._packer = _G._packer or {}
    _G._packer.profile_output = results
  end

  time([[Luarocks path setup]], true)
  local package_path_str =
    '/home/c/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/c/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/c/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/c/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua'
  local install_cpath_pattern = '/home/c/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so'
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
    if not success then
      vim.schedule(function()
        vim.api.nvim_notify(
          'packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result,
          vim.log.levels.ERROR,
          {}
        )
      end)
    end
    return result
  end

  time([[try_loadstring definition]], false)
  time([[Defining packer_plugins]], true)
  _G.packer_plugins = {
    LuaSnip = {
      after = { 'cmp_luasnip' },
      load_after = {
        ['nvim-cmp'] = true,
      },
      loaded = false,
      needs_bufread = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/LuaSnip',
      url = 'https://github.com/L3MON4D3/LuaSnip',
    },
    ['cmp-buffer'] = {
      after = { 'cmp-path' },
      after_files = { '/home/c/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua' },
      load_after = {
        ['cmp-nvim-lsp'] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/cmp-buffer',
      url = 'https://github.com/hrsh7th/cmp-buffer',
    },
    ['cmp-nvim-lsp'] = {
      after = { 'cmp-buffer' },
      after_files = { '/home/c/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua' },
      load_after = {
        ['cmp-nvim-lua'] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp',
      url = 'https://github.com/hrsh7th/cmp-nvim-lsp',
    },
    ['cmp-nvim-lua'] = {
      after = { 'cmp-nvim-lsp' },
      after_files = { '/home/c/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua' },
      load_after = {
        cmp_luasnip = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua',
      url = 'https://github.com/hrsh7th/cmp-nvim-lua',
    },
    ['cmp-path'] = {
      after_files = { '/home/c/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua' },
      load_after = {
        ['cmp-buffer'] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/cmp-path',
      url = 'https://github.com/hrsh7th/cmp-path',
    },
    cmp_luasnip = {
      after = { 'cmp-nvim-lua' },
      after_files = { '/home/c/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua' },
      load_after = {
        LuaSnip = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/cmp_luasnip',
      url = 'https://github.com/saadparwaiz1/cmp_luasnip',
    },
    ['feline.nvim'] = {
      loaded = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/start/feline.nvim',
      url = 'https://github.com/feline-nvim/feline.nvim',
    },
    ['filetype.nvim'] = {
      loaded = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/start/filetype.nvim',
      url = 'https://github.com/nathom/filetype.nvim',
    },
    ['focus.nvim'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/focus.nvim',
      url = 'https://github.com/beauwilliams/focus.nvim',
    },
    ['friendly-snippets'] = {
      after = { 'nvim-cmp' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/friendly-snippets',
      url = 'https://github.com/rafamadriz/friendly-snippets',
    },
    ['gitsigns.nvim'] = {
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim',
      url = 'https://github.com/lewis6991/gitsigns.nvim',
    },
    ['glow.nvim'] = {
      commands = { 'Glow' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/glow.nvim',
      url = 'https://github.com/ellisonleao/glow.nvim',
    },
    ['impatient.nvim'] = {
      loaded = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/start/impatient.nvim',
      url = 'https://github.com/lewis6991/impatient.nvim',
    },
    ['indent-blankline.nvim'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim',
      url = 'https://github.com/lukas-reineke/indent-blankline.nvim',
    },
    ['iswap.nvim'] = {
      commands = { 'ISwap', 'ISwapWith' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/iswap.nvim',
      url = 'https://github.com/mizlan/iswap.nvim',
    },
    ['lightspeed.nvim'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim',
      url = 'https://github.com/ggandor/lightspeed.nvim',
    },
    ['lsp-colors.nvim'] = {
      load_after = {
        ['nvim-lspconfig'] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/lsp-colors.nvim',
      url = 'https://github.com/folke/lsp-colors.nvim',
    },
    ['lsp_signature.nvim'] = {
      load_after = {
        ['nvim-lspconfig'] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim',
      url = 'https://github.com/ray-x/lsp_signature.nvim',
    },
    ['lspkind-nvim'] = {
      load_after = {
        ['nvim-cmp'] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/lspkind-nvim',
      url = 'https://github.com/onsails/lspkind-nvim',
    },
    ['luatab.nvim'] = {
      loaded = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/start/luatab.nvim',
      url = 'https://github.com/alvarosevilla95/luatab.nvim',
    },
    neogit = {
      commands = { 'Neogit' },
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/neogit',
      url = 'https://github.com/TimUntersberger/neogit',
    },
    ['null-ls.nvim'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/null-ls.nvim',
      url = 'https://github.com/jose-elias-alvarez/null-ls.nvim',
    },
    ['nvim-autopairs'] = {
      load_after = {
        ['nvim-cmp'] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/nvim-autopairs',
      url = 'https://github.com/windwp/nvim-autopairs',
    },
    ['nvim-base16.lua'] = {
      loaded = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/start/nvim-base16.lua',
      url = 'https://github.com/NvChad/nvim-base16.lua',
    },
    ['nvim-cmp'] = {
      after = { 'nvim-autopairs', 'lspkind-nvim', 'LuaSnip' },
      load_after = {
        ['friendly-snippets'] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/nvim-cmp',
      url = 'https://github.com/hrsh7th/nvim-cmp',
    },
    ['nvim-colorizer.lua'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua',
      url = 'https://github.com/NvChad/nvim-colorizer.lua',
    },
    ['nvim-lsp-installer'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer',
      url = 'https://github.com/williamboman/nvim-lsp-installer',
    },
    ['nvim-lspconfig'] = {
      after = { 'lsp_signature.nvim', 'lsp-colors.nvim' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig',
      url = 'https://github.com/neovim/nvim-lspconfig',
    },
    ['nvim-tree.lua'] = {
      commands = { 'NvimTreeToggle', 'NvimTreeFocus' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua',
      url = 'https://github.com/kyazdani42/nvim-tree.lua',
    },
    ['nvim-treesitter'] = {
      loaded = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/start/nvim-treesitter',
      url = 'https://github.com/nvim-treesitter/nvim-treesitter',
    },
    ['nvim-web-devicons'] = {
      loaded = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/start/nvim-web-devicons',
      url = 'https://github.com/kyazdani42/nvim-web-devicons',
    },
    ['nvim-window.git'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/nvim-window.git',
      url = 'https://gitlab.com/yorickpeterse/nvim-window',
    },
    orgmode = {
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/orgmode',
      url = 'https://github.com/nvim-orgmode/orgmode',
    },
    ['packer.nvim'] = {
      commands = { 'PackerSync', 'PackerStatus' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/packer.nvim',
      url = 'https://github.com/wbthomason/packer.nvim',
    },
    ['plenary.nvim'] = {
      loaded = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/start/plenary.nvim',
      url = 'https://github.com/nvim-lua/plenary.nvim',
    },
    ['project.nvim'] = {
      commands = { 'Telescope projects' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/project.nvim',
      url = 'https://github.com/ahmedkhalf/project.nvim',
    },
    sniprun = {
      commands = { 'SnipRun' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/sniprun',
      url = 'https://github.com/michaelb/sniprun',
    },
    ['stabilize.nvim'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/stabilize.nvim',
      url = 'https://github.com/luukvbaal/stabilize.nvim',
    },
    ['telescope.nvim'] = {
      commands = { 'Telescope' },
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/telescope.nvim',
      url = 'https://github.com/nvim-telescope/telescope.nvim',
    },
    ['todo-comments.nvim'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim',
      url = 'https://github.com/folke/todo-comments.nvim',
    },
    ['toggleterm.nvim'] = {
      commands = { 'ToggleTerm' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim',
      url = 'https://github.com/akinsho/toggleterm.nvim',
    },
    ['trouble.nvim'] = {
      commands = { 'Trouble', 'TroubleToggle' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/trouble.nvim',
      url = 'https://github.com/folke/trouble.nvim',
    },
    ['vim-commentary'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/vim-commentary',
      url = 'https://github.com/tpope/vim-commentary',
    },
    ['vim-matchup'] = {
      after_files = { '/home/c/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim' },
      loaded = false,
      needs_bufread = true,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/vim-matchup',
      url = 'https://github.com/andymass/vim-matchup',
    },
    ['vim-repeat'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/vim-repeat',
      url = 'https://github.com/tpope/vim-repeat',
    },
    ['vim-surround'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/vim-surround',
      url = 'https://github.com/tpope/vim-surround',
    },
    ['vista.vim'] = {
      commands = { 'Vista' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/vista.vim',
      url = 'https://github.com/liuchengxu/vista.vim',
    },
    ['which-key.nvim'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/which-key.nvim',
      url = 'https://github.com/folke/which-key.nvim',
    },
    ['winshift.nvim'] = {
      commands = { 'WinShift' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/c/.local/share/nvim/site/pack/packer/opt/winshift.nvim',
      url = 'https://github.com/sindrets/winshift.nvim',
    },
  }

  time([[Defining packer_plugins]], false)
  local module_lazy_loads = {
    ['^cmp_nvim_lsp'] = 'friendly-snippets',
    ['^focus'] = 'focus.nvim',
    ['^lspconfig'] = 'nvim-lspconfig',
    ['^null%-ls'] = 'null-ls.nvim',
    ['^nvim%-lsp%-installer'] = 'nvim-lsp-installer',
    ['^nvim%-window'] = 'nvim-window.git',
    ['^telescope'] = 'telescope.nvim',
    ['^todo%-comments'] = 'todo-comments.nvim',
    ['^which%-key'] = 'which-key.nvim',
  }
  local lazy_load_called = { ['packer.load'] = true }
  local function lazy_load_module(module_name)
    local to_load = {}
    if lazy_load_called[module_name] then
      return nil
    end
    lazy_load_called[module_name] = true
    for module_pat, plugin_name in pairs(module_lazy_loads) do
      if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
        to_load[#to_load + 1] = plugin_name
      end
    end

    if #to_load > 0 then
      require 'packer.load'(to_load, { module = module_name }, _G.packer_plugins)
      local loaded_mod = package.loaded[module_name]
      if loaded_mod then
        return function(modname)
          return loaded_mod
        end
      end
    end
  end

  if not vim.g.packer_custom_loader_enabled then
    table.insert(package.loaders, 1, lazy_load_module)
    vim.g.packer_custom_loader_enabled = true
  end

  -- Command lazy-loads
  time([[Defining lazy-load commands]], true)
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file WinShift lua require("packer.load")({'winshift.nvim'}, { cmd = "WinShift", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[au CmdUndefined Telescope projects ++once lua require"packer.load"({'project.nvim'}, {}, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file ISwapWith lua require("packer.load")({'iswap.nvim'}, { cmd = "ISwapWith", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file PackerStatus lua require("packer.load")({'packer.nvim'}, { cmd = "PackerStatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file PackerSync lua require("packer.load")({'packer.nvim'}, { cmd = "PackerSync", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file ISwap lua require("packer.load")({'iswap.nvim'}, { cmd = "ISwap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file NvimTreeFocus lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file ToggleTerm lua require("packer.load")({'toggleterm.nvim'}, { cmd = "ToggleTerm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load commands]], false)

  vim.cmd [[augroup packer_load_aucmds]]
  vim.cmd [[au!]]
  -- Filetype lazy-loads
  time([[Defining lazy-load filetype autocommands]], true)
  vim.cmd [[au FileType org ++once lua require("packer.load")({'orgmode'}, { ft = "org" }, _G.packer_plugins)]]
  time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
  time([[Defining lazy-load event autocommands]], true)
  vim.cmd [[au BufRead * ++once lua require("packer.load")({'stabilize.nvim', 'indent-blankline.nvim', 'friendly-snippets', 'lightspeed.nvim', 'vim-commentary', 'vim-repeat', 'vim-surround', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
  time([[Defining lazy-load event autocommands]], false)
  vim.cmd 'augroup END'
  vim.cmd [[augroup filetypedetect]]
  time(
    [[Sourcing ftdetect script at: /home/c/.local/share/nvim/site/pack/packer/opt/orgmode/ftdetect/filetype.lua]],
    true
  )
  vim.cmd [[source /home/c/.local/share/nvim/site/pack/packer/opt/orgmode/ftdetect/filetype.lua]]
  time(
    [[Sourcing ftdetect script at: /home/c/.local/share/nvim/site/pack/packer/opt/orgmode/ftdetect/filetype.lua]],
    false
  )
  time([[Sourcing ftdetect script at: /home/c/.local/share/nvim/site/pack/packer/opt/orgmode/ftdetect/org.vim]], true)
  vim.cmd [[source /home/c/.local/share/nvim/site/pack/packer/opt/orgmode/ftdetect/org.vim]]
  time([[Sourcing ftdetect script at: /home/c/.local/share/nvim/site/pack/packer/opt/orgmode/ftdetect/org.vim]], false)
  time(
    [[Sourcing ftdetect script at: /home/c/.local/share/nvim/site/pack/packer/opt/orgmode/ftdetect/org_archive.vim]],
    true
  )
  vim.cmd [[source /home/c/.local/share/nvim/site/pack/packer/opt/orgmode/ftdetect/org_archive.vim]]
  time(
    [[Sourcing ftdetect script at: /home/c/.local/share/nvim/site/pack/packer/opt/orgmode/ftdetect/org_archive.vim]],
    false
  )
  vim.cmd 'augroup END'
  if should_profile then
    save_profiles()
  end
end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command(
    'echohl ErrorMsg | echom "Error in packer_compiled: '
      .. error_msg
      .. '" | echom "Please check your config for correctness" | echohl None'
  )
end
