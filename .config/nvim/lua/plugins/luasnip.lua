return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "v2.*",
  lazy = true,
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = "~/.vscode/extensions/ms-kubernetes-tools.vscode-kubernetes-tools-*/snippets"
    })
  end,
  keys = {
    { "<leader>ss", function() require("luasnip.loaders").edit_snippet_files() end, desc = "Edit snippets" },
  }
}
