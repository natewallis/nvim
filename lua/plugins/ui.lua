return {
  {
    -- custom status at bottom of window
    'vim-airline/vim-airline',
    -- catppuccin color scheme
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        vim.cmd.colorscheme "catppuccin"
      end
    },
    -- colorbuddy color manager (currently not used)
    'tjdevries/colorbuddy.nvim',
    -- gruvbuddy for colorbuddy (currently not used)
    {
      'tjdevries/gruvbuddy.nvim',
      --config = function()
      --  require('colorbuddy').colorscheme('gruvbuddy')
      --end
    }
  }
}
