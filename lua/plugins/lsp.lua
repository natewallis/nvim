local opt = vim.opt
local api = vim.api

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- collides with harpoon. seeya!
  --  api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<space>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

return {
  'hrsh7th/cmp-nvim-lsp',
  {
    'neovim/nvim-lspconfig',
    config = function()
      local client_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)

      local servers = { "solargraph", "yamlls", "lua_ls" }
      for _, lsp in pairs(servers) do
        require("lspconfig")[lsp].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          flags = {
            debounce_text_changes = 150,
          },
        })
      end
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
    }
  }
}
