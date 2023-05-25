return {
  {
    {
      'L3MON4D3/LuaSnip',
      version = '1.*',
      build = 'make install_jsregexp',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
        require 'luasnip'.filetype_extend('ruby', { 'rails' })
      end,
      dependencies = {
        'rafamadriz/friendly-snippets',
      },
    },
    'rafamadriz/friendly-snippets',
    {
      'saadparwaiz1/cmp_luasnip',
      dependencies = {
        'nvim-cmp',
        'L3MON4D3/LuaSnip'
      }
    }
  }
}
