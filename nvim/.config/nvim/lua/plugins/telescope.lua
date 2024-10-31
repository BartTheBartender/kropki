-- telescope for opening files in nvim and greping them
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- require telescope
    local builtin = require('telescope.builtin')
    -- set <C-p> for finding files
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    -- set <leader>fg for greping in files
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  end
}

