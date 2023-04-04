local map = vim.api.nvim_set_keymap

map('n', ';', ':', {})

-- motion
map('n', 'gl', '$', {})
map('n', 'gh', '0', {})
map('n', 'ge', 'G', {})

-- selection
map('n', 'c', 'cl', {}) 
map('n', 's', 'V', {})
map('v', 's', ':s', {})
map('n', '%', 'ggVG', {}) 
