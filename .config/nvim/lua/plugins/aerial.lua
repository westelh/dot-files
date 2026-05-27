-- https://github.com/stevearc/aerial.nvim
-- Code structure outline

return {
  'stevearc/aerial.nvim',
  opts = {},

  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },


  keys = {
    -- outline window
    { '<leader>a',  '<cmd>AerialToggle!<CR>',   desc = 'Aerial: toggle outline' },
    { '<leader>ao', '<cmd>AerialOpen!<CR>',     desc = 'Aerial: open outline' },
    { '<leader>ac', '<cmd>AerialClose<CR>',     desc = 'Aerial: close outline' },

    -- symbol navigation
    { ']a',         '<cmd>AerialNext<CR>',      desc = 'Aerial: next symbol' },
    { '[a',         '<cmd>AerialPrev<CR>',      desc = 'Aerial: previous symbol' },

    -- nav window
    { '<leader>an', '<cmd>AerialNavToggle<CR>', desc = 'Aerial: toggle nav' },

    -- debug
    { '<leader>ai', '<cmd>AerialInfo<CR>',      desc = 'Aerial: info' },
  },
}
