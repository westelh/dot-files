-- https://github.com/obsidian-nvim/obsidian.nvim
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",        -- recommended, use latest release instead of latest commit
  dependencies = {
    "saghen/blink.cmp", -- as a completion engine
    "ibhagwan/fzf-lua"  -- as a picker
  },

  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    -- Will be removed in 4.0.0
    legacy_commands = false,

    picker = {
      name = 'fzf-lua'
    },

    workspaces = {
      {
        name = "Obsidian Vault",
        path = vim.env.HOME .. '/Documents/My Vault'
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

  keys = {
    -- Top level commands
    { "<leader>o",  "<cmd>Obsidian<cr>",              desc = "Open obsidian menu" },
    { "<leader>os", "<cmd>Obsidian search<cr>",       desc = "Search the vault" },
    { "<leader>on", "<cmd>Obsidian new<cr>",          desc = "New markdown" },
    { "<leader>oo", "<cmd>Obsidian open<cr>",         desc = "Open in app" },
    { "<leader>ot", "<cmd>Obsidian tags<cr>",         desc = "Tag picker" },
    { "<leader>oq", "<cmd>Obsidian quick_switch<cr>", desc = "Quick switch" },
  }
}
