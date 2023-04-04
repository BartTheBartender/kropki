require("nvim-treesitter.configs").setup {
  ensure_installed = { 'c', 'vim', 'rust', 'lua' },
  ignore_install = {},
  highlight = {
    enable = true,
    disable = { 'help' },
  },
}
