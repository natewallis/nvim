-- leader as space
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>t", function()
  print("Leader key works!")
end, { desc = "Test leader key" })

-- bootstrap lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load lazy plugins
require("lazy").setup("plugins")

--clipboard
-- vim.cmd "let g:vsnip_filetypes.ruby = ['rails']"
