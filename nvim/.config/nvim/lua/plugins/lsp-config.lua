return {

	-- mason.nvim for interacting with lsp servers
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- mason-lspconfig for easier LSP setup
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"rust_analyzer",
					"marksman",
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

			-- Enable hover text wrapping and rounded borders
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
				max_width = 80,
				max_height = 20,
			})

			-- Improve popup height and enable wrapping for hover windows
			vim.api.nvim_set_option("pumheight", 15)
			vim.api.nvim_set_option("wrap", true)

			-- LSP Server configurations
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			lspconfig.clangd.setup({
				capabilities = capabilities,
				init_options = {
					clangdFileStatus = true,
					fallbackFlags = { "--std=c++17" },
				},
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
						diagnostics = {
							enable = true,
						},
						cargo = {
							loading = { initialization = true },
						},
						procMacro = { enable = true },
					},
				},
			})

			lspconfig.marksman.setup({ capabilities = capabilities })

			-- Keymaps for LSP interactions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},

	-- lsp_signature.nvim for improved function signature popups
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				bind = true,
				floating_window = true,
				hint_enable = false, -- Disable inline hints if desired
			})
		end,
	},
}
