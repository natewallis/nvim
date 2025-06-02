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
        'nvim-neotest/nvim-nio',
        'jfpedroza/neotest-elixir',
        'olimorris/neotest-rspec',
      },
      config = function()
        require('neotest').setup({
          adapters = {
            require('neotest-elixir'),
            require("neotest-rspec")
          }
        })
      end
    },
  },
  'jfpedroza/neotest-elixir',
}
