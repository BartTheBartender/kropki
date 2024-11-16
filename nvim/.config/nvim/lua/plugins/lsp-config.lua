return {

  -- mason.nvim for interacting with lsp servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- mason-lspconfig for making the interaction between mason and lspconfig better
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({

        -- specify languages for which lsp servers shall be installed after setup them!
        ensure_installed = {
          "lua_ls",
          "clangd",
          "rust_analyzer",
          -- latex
          "texlab",

          -- "pylyzer",
        },
      })
    end,
  },

  -- lspconfig for interacting with nvim
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- set up lsp servers
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })


      lspconfig.texlab.setup({ capabilities = capabilities })
      -- lspconfig.pylyzer.setup({ capabilities = capabilities })

      -- keymaps for interacting with lsp
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
