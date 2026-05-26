return {
  "SmiteshP/nvim-navic",

  dependencies = {
    "nvim-lualine/lualine.nvim",
    "neovim/nvim-lspconfig"
  },

  ft = { 'yaml', 'lua' },

  config = function()
    local navic = require('nvim-navic')

    local onattach = function(client, bufnr)
      navic.attach(client, bufnr)

      -- configure lualine
      require('lualine').setup({
        sections = {
          lualine_c = { {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end
          } }
        }
      })
    end

    vim.lsp.config('yamlls', { on_attach = onattach })
    vim.lsp.config('lua_ls', { on_attach = onattach })
  end
}
