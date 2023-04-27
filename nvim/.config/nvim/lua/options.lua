local opt = vim.opt

-- context
opt.number = true
opt.relativenumber = true
opt.wildmenu = true
opt.lazyredraw = true
opt.showmatch = true

-- comments
--- do not continue to next line
opt.fo:remove('c')
opt.fo:remove('r')
opt.fo:remove('o')

-- appearance
--- theme
opt.termguicolors = true
vim.cmd.colorscheme 'hveitivangr'
require 'colorizer'.setup()

--- whitespace
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

opt.cursorline = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- splits
opt.splitright = true
opt.splitbelow = true

-- line numbering in insert
vim.api.nvim_exec(
  [[
    augroup insertmodelinenumbering
    autocmd!
    au InsertEnter * :set norelativenumber
    au InsertLeave * :set relativenumber
    augroup END
  ]],
  false
)
