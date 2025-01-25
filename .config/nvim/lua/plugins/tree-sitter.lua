return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  -- $type TSConfig
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "elixir",
      "heex",
      "javascript",
      "html",
      "cue",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
