-- another plugin to look at is gitsigns


return {
  {
    -- improved git control inside nvim
    'tpope/vim-fugitive',
    -- show git blame in editor
    'f-person/git-blame.nvim',
    -- heard its good, haven't investigated yet
    -- 'lewis6991/gitsigns.nvim'
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      local neogit = require('neogit')
      vim.keymap.set('n', '<leader>gs', function() require('neogit').open() end, { desc = "Open Neogit" })
    end
  }
}
