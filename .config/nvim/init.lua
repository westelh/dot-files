require("config.lazy")
require('config.lsp')
require('config.neovide')
require('config.keymap')
require('config.folding')
require('config.filetype')
require('config.autocmd')
-- require('config.sessions')

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.number = true
vim.o.list = true
vim.o.ambiwidth = 'single'
vim.o.conceallevel = 1
vim.o.clipboard = 'unnamed,unnamedplus'
vim.cmd 'syntax enable'
