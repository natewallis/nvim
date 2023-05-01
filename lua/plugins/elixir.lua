return {
  --collection of plugins to manage elixir ls support
  {
    "elixir-tools/elixir-tools.nvim",
    ft = { "elixir", "eex", "heex", "surface" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        elixirls = {
          settings = elixirls.settings {
            dialyzerEnabled = true,
            fetchDeps = false,
            enableTestLenses = false,
            suggestSpecs = false,
          },
          log_level = vim.lsp.protocol.MessageType.Log,
          message_level = vim.lsp.protocol.MessageType.Log,
          on_attach = function(client, bufnr)
            -- whatever keybinds you want, see below for more suggestions
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>",
              { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>",
              { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>",
              { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>r", vim.lsp.codelens.run, map_opts)
          end,
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- using for syntax highlighting
  'elixir-editors/vim-elixir'
}
