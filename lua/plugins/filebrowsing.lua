vim.wo.relativenumber = true

return {
  {
    "preservim/nerdtree",
    config = function()
      vim.cmd ":NERDTree"
    end
  },
  'ctrlpvim/ctrlp.vim'
}
