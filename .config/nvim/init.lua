vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.number = true
vim.o.list = true
vim.o.ambiwidth = 'single'
vim.o.conceallevel = 1

vim.cmd 'syntax enable'

require("config.lazy")
local system = require("config.system")

vim.filetype.add({
  pattern = {
    [".*/templates/.*%.yaml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
  },
})

local function open(it, fallback)
  if it:match("^http://") or it:match("^https://") then
    system.open(it)
  else
    fallback(it)
  end
end

vim.keymap.set("n", "gf", function()
  open(vim.fn.expand("<cfile>"), function()
    vim.cmd("normal! gf")
  end)
end)

vim.keymap.set("n", "gF", function()
  open(vim.fn.expand("<cfile>"), function()
    vim.cmd("normal! gf")
  end)
end)

