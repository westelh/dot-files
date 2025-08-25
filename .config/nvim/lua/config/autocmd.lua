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
