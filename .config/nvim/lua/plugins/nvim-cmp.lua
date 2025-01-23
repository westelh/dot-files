return {
  "hrsh7th/nvim-cmp",
  event = "BufEnter",
  dependencies = {
    -- Buffer
    "hrsh7th/cmp-buffer",
    -- LSP
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require'cmp'
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-1>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
      }, {
        { name = 'buffer' },
      }),
    })

    -- LSPCONFIG SETUP
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require'lspconfig'.lua_ls.setup({
      capabilities = capabilities,
      on_init = function (client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
            return
          end
        end
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = { version = 'LuaJIT' },
          checkThirdParty = false,
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
              '~/Documents/LLS-Addons/luvit'
            },
          }
        })
      end,
      settings = { Lua = {} },
    })

    -- Lazy load of lspconfig runs autocmd after the BufReadPost event
    -- Here explicitly start and attach lsp to the buffer.
    vim.cmd 'LspStart'
  end,
}

