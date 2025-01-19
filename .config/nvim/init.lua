vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.number = true
vim.o.list = true
vim.o.ambiwidth = 'double'
vim.o.conceallevel = 1

vim.cmd 'syntax enable'

require("config.lazy")
