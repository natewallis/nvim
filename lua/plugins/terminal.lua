vim.api.nvim_set_keymap('n', '<Leader>t', ':Term<CR>', { noremap = true, silent = true })

return {
  {
    -- provides split terminal support (and other featuers) in nvim
    'vimlab/split-term.vim'
  }
}
