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
  Snippet = ' Snippet',
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
  event = {
    "BufEnter"
  },

  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- Load source plugins here
    require 'cmp_luasnip'
    require 'cmp_nvim_lsp'
    require 'cmp_path'
    require 'cmp_buffer'

    local custom_cr = function(fallback)
      if cmp.visible() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          cmp.confirm({ select = true })
        end
      else
        fallback()
      end
    end

    local custom_tab = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end

    local custom_shift_tab = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end

    local opts = {
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = cmp_kinds[vim_item.kind]
          return vim_item
        end
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping(custom_cr),
        ['<Tab>'] = cmp.mapping(custom_tab, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(custom_shift_tab, { "i", "s" }),
      }),

      sources = cmp.config.sources(
        {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'luasnip' },
        },
        {
          { name = 'buffer' },
        }
      ),
      snippet = {
        expand = function(args)
          require 'luasnip'.lsp_expand(args.body)
        end
      }
    }
    cmp.setup(opts)
  end,
}
