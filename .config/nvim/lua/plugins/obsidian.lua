return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp", -- for completion of note references.
    "nvim-telescope/telescope.nvim",
  },
  ft = "markdown",

  -- Globally available commands trigger the lazy load
  cmd = {
    "ObsidianCheck",
    "ObsidianNew",
    "ObsidianOpen",
    "ObsidianQuickSwitch",
    "ObsidianRename",
    "ObsidianSearch",
    "ObsidianTemplate",
    "ObsidianToday",
    "ObsidianTomorrow",
    "ObsidianWorkspace",
    "ObsidianYesterday",
  },
  opts = {
    workspaces = {
      {
        name = "Vault",
        path = "~/Documents/Vault",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    mappings = {
      -- Buffer local keymappings here will be loaded when plugin is lazy-loaded
      ["<localleader>o"] = {
        action = "<cmd>ObsidianOpen<cr>",
        opts = { buffer = true, desc = "Open current document in Obsidian App" },
      },
      ["<localleader>f"] = {
        action = "<cmd>ObsidianFollowLink<cr>",
        opts = { buffer = true, desc = "Follow the link under the cursor" },
      },
      ["<localleader>b"] = {
        action = "<cmd>ObsidianBacklinks<cr>",
        opts = { buffer = true, desc = "Search backlinks of this document" },
      }
    }
  },
  keys = {
    { "<leader>o", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian documents"},
    { "<leader>n", "<cmd>ObsidianNew<cr>", desc = "Create new Obsidian document"},
  }
}

