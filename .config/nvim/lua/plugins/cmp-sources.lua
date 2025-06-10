return {
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",

  -- LSP
  {
    'hrsh7th/cmp-nvim-lsp',
    config = function()
      local cap = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.config('*', { capabilities = cap })
    end
  },

  -- LuaSnip
  'saadparwaiz1/cmp_luasnip'
}
