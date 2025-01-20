return {
  {
    "ericbn/vim-solarized",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      vim.cmd([[colorscheme solarized]])
    end,
  },
  {
    "vim-airline/vim-airline",
    lazy = false,
    priority = 100,
    config = function()
      -- Customize airline symbols for work-around of the issue
      -- https://github.com/vim-airline/vim-airline/issues/2704
      vim.g['airline#extensions#whitespace#symbol'] = '!'
    end,
  },
  {
    "preservim/nerdtree",
    dependencies = { "ryanoasis/vim-devicons" },
    keys = {
      { "<C-n>", "<cmd>NERDTreeToggle<cr>", desc = "Toggle NerdTree" },
    },
    config = function()
      -- NertTreeタブが最後のタブの時閉じてquitする
      vim.cmd 'autocmd BufEnter * if tabpagenr(\'$\') == 1 && winnr(\'$\') == 1 && exists(\'b:NERDTree\') && b:NERDTree.isTabTree() | quit | endif'
    end,
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      vim.g.copilot_filetypes = { markdown = 0 }
    end,
  },
  { "ryanoasis/vim-devicons", lazy = true },
  {
    "bronson/vim-trailing-whitespace",
    lazy = false,
    config = function()
      vim.cmd([[autocmd VimEnter * ++once call matchadd('ExtraWhitespace', "[\u00A0\u2000-\u200B\u3000]") | highlight ExtraWhitespace ctermbg=darkmagenta guibg=darkmagenta]])
    end,
    -- https://zenn.dev/kawarimidoll/articles/450a1c7754bde6
    -- u00A0 ' ' no-break space
    -- u2000 ' ' en quad
    -- u2001 ' ' em quad
    -- u2002 ' ' en space
    -- u2003 ' ' em space
    -- u2004 ' ' three-per em space
    -- u2005 ' ' four-per em space
    -- u2006 ' ' six-per em space
    -- u2007 ' ' figure space
    -- u2008 ' ' punctuation space
    -- u2009 ' ' thin space
    -- u200A ' ' hair space
    -- u200B '​' zero-width space
    -- u3000 '　' ideographic (zenkaku) space
  },
}

