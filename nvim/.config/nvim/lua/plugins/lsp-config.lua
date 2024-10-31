return {

  -- mason.nvim for interacting with lsp servers
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },

  -- mason-lspconfig for making the interaction between mason and lspconfig better
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({

        -- specify languages for which lsp servers shall be installed after setup them!
        ensure_installed = {
          "lua_ls",
          "clangd",
          "rust_analyzer"
        }
      })
    end
  },

  -- lspconfig for interacting with nvim
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      -- set up lsp servers
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.rust_analyzer.setup({})

      -- keymaps for interacting with lsp
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
