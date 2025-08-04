return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "suketa/nvim-dap-ruby"
    },
    config = function()
      local dap = require("dap")

      require("dap-ruby").setup()

      vim.keymap.set('n', '<leader>dc', dap.continue)
      vim.keymap.set('n', '<leader>dm', dap.step_over)
      vim.keymap.set('n', '<leader>di', dap.step_into)
      vim.keymap.set('n', '<leader>dk', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>dn', dap.clear_breakpoints)
      vim.keymap.set('n', '<leader>dt', dap.terminate)

      local repl = require('dap.repl')
      local widgets = require('dap.ui.widgets')                                           -- configure widgets
      local scopes = widgets.sidebar(widgets.scopes, {}, 'vsplit')                        -- set scopes as right pane
      local frames = widgets.sidebar(widgets.frames, { height = 10 }, 'belowright split') -- set frames as bottom pane

      vim.keymap.set('n', '<leader>da', function() return repl.toggle({}, 'belowright split') end)
      vim.keymap.set('n', '<leader>ds', scopes.toggle)
      vim.keymap.set('n', '<leader>du', frames.toggle)
      vim.keymap.set('n', '<leader>dh', widgets.hover)
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  }
}
