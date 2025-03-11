return {
  {
    -- wrapper for running tests of different granularities
    -- 'vim-test/vim-test',
    {
      'nvim-neotest/neotest',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim',
        'jfpedroza/neotest-elixir',
        'nvim-neotest/nvim-nio'
      },
      config = function()
        require('neotest').setup({
          adapters = {
            require('neotest-elixir')
          }
        })
      end
    },
  },
  'jfpedroza/neotest-elixir',
}
