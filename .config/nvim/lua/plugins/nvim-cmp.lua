local cmp_kinds = {
  Text = ' Text',
  Method = ' Method',
  Function = ' Function',
  Constructor = ' Constructor',
  Field = ' Field',
  Variable = ' Variable',
  Class = ' Class',
  Interface = ' Interface',
  Module = ' Module',
  Property = ' Property',
  Unit = ' Unit',
  Value = ' Value',
  Enum = ' Enum',
  Keyword = ' Keyword',
  Snippet = ' Snippet',
  Color = ' Color',
  File = ' File',
  Reference = ' Reference',
  Folder = ' Folder',
  EnumMember = ' EnumMember',
  Constant = ' Constant',
  Struct = ' Struct',
  Event = ' Event',
  Operator = ' Operator',
  TypeParameter = ' TypeParameter',
}

return {
  "hrsh7th/nvim-cmp",
  event = "BufEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- LSP
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    -- Snippet
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- For color customize
    "maxmx03/solarized.nvim",
  },
  config = function()
    local cmp = require'cmp'
    local luasnip = require'luasnip'
    local colors = require('solarized.utils').get_colors()

    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg=colors.yellow })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
      },
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = cmp_kinds[vim_item.kind]
          return vim_item
        end
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping(function(fallback)
           if cmp.visible() then
             if luasnip.expandable() then
               luasnip.expand()
             else
               cmp.confirm({
                 select = true,
               })
             end
           else
             fallback()
           end
         end),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
       }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' }
      }, {
        { name = 'buffer' },
      }),
      snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body)
        end
      }
    })

    -- LSPCONFIG SETUP
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require'lspconfig'.terraformls.setup{}
    require'lspconfig'.helm_ls.setup{}
    require'lspconfig'.gh_actions_ls.setup({
      capabilities = capabilities,
    })
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

