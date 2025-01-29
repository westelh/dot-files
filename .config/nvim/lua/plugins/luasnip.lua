return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  keys = {
    { "<Tab>", function() require'luasnip'.expand() end, mode = "i", silent = true },
    { "<S-Tab>", function() require'luasnip'.jump(-1) end, mode = "i", silent = true },
  },
  config = function ()
    require("luasnip.loaders.from_vscode").lazy_load()
  end
}
