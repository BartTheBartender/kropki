-- vim.api.nvim_exec(
--   [[
--     augroup hardmode
--     autocmd!
--     autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
--     augroup END
--   ]],
--   false
-- )

vim.api.nvim_set_keymap('n', '<leader>h', '<Esc>:call ToggleHardMode()<CR>', {noremap = true})

-- medium mode
vim.api.nvim_set_keymap('n', '<Left>', ':echo "No left for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<Left>', ':<C-u>echo "No left for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<Left>', '<C-o>:echo "No left for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>', ':echo "No down for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<Down>', ':<C-u>echo "No down for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<Down>', '<C-o>:echo "No down for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Right>', ':echo "No right for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<Right>', ':<C-u>echo "No right for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<Right>', '<C-o>:echo "No right for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Up>', ':echo "No up for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<Up>', ':<C-u>echo "No up for you!"<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<Up>', '<C-o>:echo "No up for you!"<CR>', {noremap = true})
