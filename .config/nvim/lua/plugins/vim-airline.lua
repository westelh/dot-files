return {
  "vim-airline/vim-airline",
  lazy = false,
  priority = 100,
  init = function()
    -- Customize airline symbols for work-around of the issue
    -- https://github.com/vim-airline/vim-airline/issues/2704
    vim.g['airline#extensions#whitespace#symbol'] = '!'
  end,
}
