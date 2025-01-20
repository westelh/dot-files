return {
  "preservim/nerdtree",
  dependencies = { "ryanoasis/vim-devicons" },
  keys = {
    { "<C-n>", "<cmd>NERDTreeToggle<cr>", desc = "Toggle NerdTree" },
  },
  config = function()
    -- NertTreeタブが最後のタブの時閉じてquitする
    vim.cmd 'autocmd BufEnter * if tabpagenr(\'$\') == 1 && winnr(\'$\') == 1 && exists(\'b:NERDTree\') && b:NERDTree.isTabTree() | quit | endif'
  end,
}

