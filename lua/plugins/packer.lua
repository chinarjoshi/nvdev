local present, packer = pcall(require, 'packer')

packer.init {
  display = {
    open_fn = function()
        return require('packer.util').float { border = 'single' }
    end,
    prompt_border = 'single',
  },
  git = {
    clone_timeout = 6000,
  },
  auto_clean = true,
  compile_on_sync = true,
}

-- require('core.utils').loadall()

return packer
