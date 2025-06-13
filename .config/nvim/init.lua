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

local system = require("config.system")
require("config.lazy")
require('config.sessions')
require('config.lsp')
require('config.neovide')

vim.filetype.add({
  extension = {
    -- Map .tf to terraform file
    -- No need to treat it as TF MUD file
    tf = "terraform"
  },
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

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'LuasnipChoiceNodeEnter',
  callback = function()
    vim.schedule(function()
      vim.notify('LuasnipChoiceEnter')
      require("luasnip.extras.select_choice")()
    end)
  end
})

-- Folding
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*',
  callback = function()
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- ← 正しい関数名
    vim.o.foldtext = "v:lua.vim.treesitter.foldtext()" -- Lua関数で表示カスタム（任意）
    vim.o.foldenable = false
  end
})

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

-- highlight yanked area
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
