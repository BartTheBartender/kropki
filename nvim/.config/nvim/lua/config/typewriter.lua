vim.g.limelight_conceal_guifg = '#675d51'

vim.api.nvim_set_keymap('n', '<leader>g', '<Esc>:Goyo<CR>:Limelight!!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>s', '<Esc>:set spell!<CR>', {noremap = true, silent = true})
