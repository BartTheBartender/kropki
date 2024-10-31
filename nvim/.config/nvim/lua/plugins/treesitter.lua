-- treesitter for AST building while coding
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- require treesitter
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- languages to be parsed
      ensure_installed = {"lua", "javascript", "c", "rust", "haskell", "python"},
      -- enable highlighting and indents
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}


