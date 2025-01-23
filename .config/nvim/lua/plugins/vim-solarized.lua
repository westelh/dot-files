return {
  "ericbn/vim-solarized",
  lazy = false,
  priority = 1000,
  init = function()
    vim.opt.background = 'dark'
  end,
  config = function()
    vim.cmd([[colorscheme solarized]])
  end,
}
