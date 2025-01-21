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

vim.keymap.set("n", "gf", function()
  local cfile = vim.fn.expand("<cfile>")
  if cfile:match("^https?://") or cfile:match("^http://") then
    vim.fn.system("open " .. cfile)
  else
    vim.cmd("normal! gf")
  end
end)

vim.keymap.set("n", "gF", function()
  local cfile = vim.fn.expand("<cfile>")
  if cfile:match("^https?://") or cfile:match("^http://") then
    vim.fn.system("open " .. cfile)
  else
    vim.cmd("normal! gF")
  end
end)

