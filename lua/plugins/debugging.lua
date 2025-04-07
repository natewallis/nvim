return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      -- Ruby adapter configuration using rdbg (Ruby 3.1+)
      dap.adapters.ruby = {
        type = 'executable',
        command = 'rdbg',
        args = { '--open', '--port', '12345', '--', 'ruby' },
      }
      dap.configurations.ruby = {
        {
          type = 'ruby',
          request = 'attach',
          name = "Attach to running Ruby process",
          remoteHost = "127.0.0.1",
          remotePort = "6000",
          cwd = vim.fn.getcwd(),
        },
        {
          type = 'ruby',
          request = 'launch',
          name = "Launch current file",
          program = "${file}",
        },
      }

      -- configure widgets

      local widgets = require('dap.ui.widgets')

      -- set scopes as right pane
      local scopes = widgets.sidebar(widgets.scopes, {}, 'vsplit')

      -- set frames as bottom pane
      local frames = widgets.sidebar(widgets.frames, { height = 10 }, 'belowright split')

      vim.keymap.set('n', '<leader>dj', dap.continue)
      vim.keymap.set('n', '<leader>dm', dap.step_over)
      vim.keymap.set('n', '<leader>di', dap.step_into)
      vim.keymap.set('n', '<leader>dk', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>dn', dap.clear_breakpoints)
      vim.keymap.set('n', '<leader>dt', dap.terminate)

      local repl = require('dap.repl')

      vim.keymap.set(
        'n', '<leader>da',
        function()
          return repl.toggle({}, 'belowright split')
        end
      )

      vim.keymap.set('n', '<leader>ds', scopes.toggle)
      vim.keymap.set('n', '<leader>du', frames.toggle)
      vim.keymap.set('n', '<leader>dh', widgets.hover)
    end
  }
}
