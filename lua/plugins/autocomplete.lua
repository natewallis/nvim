return {
  {
    -- lsp client for nvim
    'hrsh7th/cmp-nvim-lsp',
    -- completion engine for nvim (supports lsp server if available)
    'hrsh7th/nvim-cmp',
    -- nvim snippet engine for vscode format snippets
    'hrsh7th/vim-vsnip',
    -- nvim lsp config for nvim lsp client
    {
      'neovim/nvim-lspconfig',
      config = function()
        -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local cmp = require 'cmp'

        cmp.setup({
          snippet = {
            expand = function(args)
              -- setting up snippet engine
              -- this is for vsnip, if you're using other
              -- snippet engine, please refer to the `nvim-cmp` guide
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          mapping = {
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          },
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' }, -- For vsnip users.
            { name = 'buffer' }
          })
        })
      end
    },
    {
      'rafamadriz/friendly-snippets'
    }
  }
}
