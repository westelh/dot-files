local system = require("config.system")

vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>bnext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>bprevious<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>bd<cr>', { noremap = true })

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


