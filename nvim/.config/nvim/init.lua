-- set tab as two spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- set leading key as space
vim.g.mapleader= " "

-- set nvim packet manager as lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {

}

local plugins = {

  -- catppuccin (mocha) for better colors
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000 
  },

  -- telescope for file management
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- treesitter for AST building while coding
  {
    "nvim-treesitter/nvim-treesitter", build= ":TSUpdate"
  }
}

require("lazy").setup(plugins, opts)

-- require catppuccin
require("catppuccin").setup()
-- set the colorscheme to it!
vim.cmd.colorscheme "catppuccin"

-- require telescope
local builtin = require('telescope.builtin')
-- set <C-p> for finding files
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- set <leader>fg for greping in files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- require treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  -- languages to be parsed
  ensure_installed = {"lua", "javascript", "c", "rust", "haskell", "python"},
  -- enable highlighting and indents
  highlight = { enable = true },
  indent = { enable = true }
})
