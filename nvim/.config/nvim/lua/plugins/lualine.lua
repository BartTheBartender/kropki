-- lualine for displaying info about nvim
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        theme = 'catppuccin'
      }
    })
  end
}
