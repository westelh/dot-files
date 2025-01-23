return {
  "preservim/nerdtree",
  dependencies = { "ryanoasis/vim-devicons" },
  keys = {
    { "<C-n>", "<cmd>NERDTreeToggle<cr>", desc = "Toggle NerdTree" },
  },
  config = function()
    -- https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt
    -- NertTreeタブが最後のタブの時閉じてquitする
    vim.cmd 'autocmd BufEnter * if tabpagenr(\'$\') == 1 && winnr(\'$\') == 1 && exists(\'b:NERDTree\') && b:NERDTree.isTabTree() | quit | endif'
    vim.g.NERDTreeQuitOnOpen = 3
    vim.g.NERDTreeShowBookmarks = 1

    local bookmarks_dir = vim.fn.expand('~/.local/share/nerdtree')
    vim.fn.system({'mkdir', '-p', bookmarks_dir})
    vim.g.NERDTreeBookmarksFile = bookmarks_dir .. '/bookmarks'
  end,
}

