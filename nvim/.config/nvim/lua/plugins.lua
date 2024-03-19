local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
vim.api.nvim_exec(
  [[
    augroup Packer
      autocmd!
      autocmd BufWritePost plugins.lua PackerSync
    augroup end
  ]],
  false
)

return require('packer').startup({
  function(use)
    use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }
    use 'wbthomason/packer.nvim'

    -- quality of life
    use { 'sbdchd/neoformat', config = [[require('config.neoformat')]] }
    use { "tpope/vim-commentary", event = "VimEnter" }
    use { 'mg979/vim-visual-multi', config = [[require('config.multicursor')]] }
    use { 'wikitopian/hardmode', config = [[require('config.hardmode')]] }

    -- appearance
    use 'norcalli/nvim-colorizer.lua'
    use 'orhid/hveitivangr.nvim'
    use 'sainnhe/everforest'
    -- use '~/code/hveitivangr.nvim' -- for development and debugging

    -- lualine
    use { 'kyazdani42/nvim-web-devicons', event = 'VimEnter' }
    use {
      'nvim-lualine/lualine.nvim',
      event = 'VimEnter',
      config = [[require('config.statusline')]],
    }

    -- git
    use 'mhinz/vim-signify'
    use 'tpope/vim-fugitive'

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter',
      event = 'BufEnter',
      run = ':TSUpdate',
      config = [[require('config.treesitter')]],
    }
    use 'nvim-treesitter/playground'

    -- lsp
    use { 'neovim/nvim-lspconfig', config = [[require('config.lsp')]] }

    -- markdown
    use { 'orhid/goyo.vim', config = [[require('config.typewriter')]] }
    use { 'junegunn/limelight.vim', config = [[require('config.typewriter')]] }

    -- agda
    use {
      'ashinkarov/nvim-agda',
      ft = {'agda'},
      rocks = {'luautf8'},
    }

    -- automatically set up configuration after cloning packer.nvim
    -- should always be at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    luarocks = {
      python_cmd = '/opt/homebrew/bin/python3', -- set the python command to use for running hererocks
    }
  }
})
