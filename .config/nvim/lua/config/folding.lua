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

