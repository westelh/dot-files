return {
  "SmiteshP/nvim-navic",

  dependencies = {
    "nvim-lualine/lualine.nvim",
    "neovim/nvim-lspconfig"
  },

  config = function ()
    local navic = require('nvim-navic')

    local onattach = function(client, bufnr)
      navic.attach(client, bufnr)

      -- configure lualine
      require('lualine').setup({
        sections = {
          lualine_c = {{
            function ()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end
          }}
        }
      })
    end

    require('lspconfig').yamlls.setup { on_attach = onattach }
  end
}

