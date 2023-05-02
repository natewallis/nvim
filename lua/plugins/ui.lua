return {
  {
    'vim-airline/vim-airline',
    -- capppuccin color manager
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
