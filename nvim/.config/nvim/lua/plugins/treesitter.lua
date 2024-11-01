-- treesitter for AST building while coding
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- require treesitter
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- enable installing parsers automatically
      auto_install = true,
      -- enable highlighting and indents
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
