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
require('config.sessions')
require('config.lsp')
require('config.neovide')
require('config.keymap')
require('config.folding')

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

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'LuasnipChoiceNodeEnter',
  callback = function()
    vim.schedule(function()
      vim.notify('LuasnipChoiceEnter')
      require("luasnip.extras.select_choice")()
    end)
  end
})

-- highlight yanked area
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
