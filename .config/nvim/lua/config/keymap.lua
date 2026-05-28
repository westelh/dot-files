local system = require("config.system")

vim.api.nvim_set_keymap('n', 'g?', '<cmd>FzfLua keymaps<cr>', { noremap = true })

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
