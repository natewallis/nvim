-- another plugin to look at is gitsigns
return {
  {
    -- improved git control inside nvim
    'tpope/vim-fugitive',
    -- show git blame in editor
    'f-person/git-blame.nvim'
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "echasnovski/mini.pick",         -- optional
    },
    config = true
  }
}
