-- https://github.com/kevinhwang91/nvim-hlslens
-- Enhance search experience

return {
  'kevinhwang91/nvim-hlslens',

  opts = {},

  keys = {
    {
      'n',
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      mode = 'n',
      desc = 'Next search result with hlslens',
      silent = true,
      noremap = true,
    },
    {
      'N',
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      mode = 'n',
      desc = 'Previous search result with hlslens',
      silent = true,
      noremap = true,
    },
    {
      '*',
      [[*<Cmd>lua require('hlslens').start()<CR>]],
      mode = 'n',
      desc = 'Search word under cursor with hlslens',
      silent = true,
      noremap = true,
    },
    {
      '#',
      [[#<Cmd>lua require('hlslens').start()<CR>]],
      mode = 'n',
      desc = 'Search word backward with hlslens',
      silent = true,
      noremap = true,
    },
    {
      'g*',
      [[g*<Cmd>lua require('hlslens').start()<CR>]],
      mode = 'n',
      desc = 'Search partial word with hlslens',
      silent = true,
      noremap = true,
    },
    {
      'g#',
      [[g#<Cmd>lua require('hlslens').start()<CR>]],
      mode = 'n',
      desc = 'Search partial word backward with hlslens',
      silent = true,
      noremap = true,
    },
    {
      '<Leader>l',
      '<Cmd>noh<CR>',
      mode = 'n',
      desc = 'Clear search highlight',
      silent = true,
      noremap = true,
    },
  },
}
