-- https://github.com/obsidian-nvim/obsidian.nvim
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",        -- recommended, use latest release instead of latest commit
  dependencies = {
    "hrsh7th/nvim-cmp", -- for completion of note references.
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
      }
    },
    follow_url_func = vim.ui.open
  },
}
