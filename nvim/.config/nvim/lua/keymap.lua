local map = vim.keymap.set

map('n', ';', ':', {})

-- motion
map({'n','v'}, 'gl', '$', {})
map({'n','v'}, 'gh', '0', {})
map({'n','v'}, 'ge', 'G', {})

-- selection
map('n', 's', 'V', {})
map('v', 's', ':s', {})
map('n', '%', 'ggVG', {})
