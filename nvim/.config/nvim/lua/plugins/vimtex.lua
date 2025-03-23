return {
  "lervag/vimtex",
  config = function()
    -- This is necessary for VimTeX to load properly.
    vim.cmd("filetype plugin indent on")

    -- Enable Vim's and neovim's syntax-related features.
    vim.cmd("syntax enable")

    -- Set Skim as the PDF viewer for macOS
    vim.g.vimtex_view_method = "skim"

    -- Use latexmk as the compiler backend (recommended)
    vim.g.vimtex_compiler_method = "latexmk"

    -- Enable Vimtex Treesitter support for LaTeX
    vim.g.vimtex_syntax_enabled = 1
    -- vim.g.vimtex_treesitter_enabled = 1

    -- Configure latexmk (optional)
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      backend = "jobs", -- Use job backend for compilation
      build_dir = "./build", -- Optional: set a custom build directory if needed
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-synctex=1",
        "-output-directory=.build",  -- Explicitly set the output directory
      },
      continuous_mode = 1, -- Enable continuous mode
    }

    -- Function to check for missing packages and install them using tlmgr
    local function install_missing_packages()
      -- Check if any package is missing (use a regex pattern to match the output of latexmk)
      vim.fn.jobstart("latexmk -pdf %:p", {
        on_stdout = function(_, data)
          for _, line in ipairs(data) do
            if line:match(".*not found.*") then
              local package = line:match(".*'([^']+)'")
              if package then
                -- Install the package using tlmgr
                vim.fn.system("tlmgr --usermode install " .. package)
              end
            end
          end
        end,
      })
    end

    -- Trigger the install_missing_packages function before each compilation
    vim.g.vimtex_compiler_latexmk = vim.tbl_extend("force", vim.g.vimtex_compiler_latexmk, {
      options = { "-synctex=1", "-interaction=nonstopmode" },
      -- Pre-compilation hook to install missing packages
      pre_compile = install_missing_packages,
    })

    -- Keybindings for compiling and viewing PDFs
    vim.api.nvim_set_keymap("n", "<C-S-Enter>", ":VimtexCompile<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>v", ":VimtexView<CR>", { noremap = true, silent = true })
  end,
}
