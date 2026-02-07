-- https://github.com/obsidian-nvim/obsidian.nvim
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",        -- recommended, use latest release instead of latest commit
  dependencies = {
    "saghen/blink.cmp", -- as a completion engine
    "ibhagwan/fzf-lua"  -- as a picker
  },
  ft = "markdown",
  lazy = false,

  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    -- Will be removed in 4.0.0
    legacy_commands = false,

    workspaces = {
      {
        name = "iCloud",
        path = "/Users/taisei/Library/Mobile Documents/iCloud~md~obsidian/Documents/My Vault",
      },
      {
        name = "Nanaren",
        path = "/Users/taisei/Library/Mobile Documents/iCloud~md~obsidian/Documents/ななれん",
      }
    },
    -- follow_url_func is deprecated
    -- follow_url_func = vim.ui.open,
    note_id_func = function(title)
      return title
    end,

    templates = {
      folder = "templates/"
    },
  },
}
