local lspconfig = require('lspconfig')
local on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end

-- local on_attach = function(client)
--   require'completion'.on_attach(client)
-- end

-- # rust

lspconfig.rust_analyzer.setup({
  on_attach=on_attach,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },

      -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },

      cargo = {
        buildScripts = {
          enable = true,
        },
      },

      procMacro = {
        enable = true
      },
    }
  }
})

-- autocmds
vim.api.nvim_exec(
  [[
    augroup AnalyzeRust
      autocmd!
      autocmd BufWinEnter *.rs LspStart rust_analyzer
    augroup end
  ]],
  false
)

-- # lua
require'lspconfig'.lua_ls.setup {
  on_attach=on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'Lua 5.4',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- # haskell
lspconfig.hls.setup({
  on_attach=on_attach,
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
})

-- # R
lspconfig.r_language_server.setup({
  on_attach=on_attach,
})

-- # python
lspconfig.pylsp.setup({
  on_attach=on_attach,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 96
        }
      }
    }
  }
})

-- # tex
lspconfig.texlab.setup({
  on_attach=on_attach,
})
