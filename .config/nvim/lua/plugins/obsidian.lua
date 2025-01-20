local cmds = {
    "ObsidianBacklinks",
    "ObsidianCheck",
    "ObsidianFollowLink",
    "ObsidianLink",
    "ObsidianLinkNew",
    "ObsidianNew",
    "ObsidianOpen",
    "ObsidianPasteImg",
    "ObsidianQuickSwitch",
    "ObsidianRename",
    "ObsidianSearch",
    "ObsidianTemplate",
    "ObsidianToday",
    "ObsidianTomorrow",
    "ObsidianWorkspace",
    "ObsidianYesterday",
}

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp", -- for completion of note references.
    "nvim-telescope/telescope.nvim",
  },
  cmd = cmds,
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
  },
  keys = {
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search obsidian documents by ripgrep"},
    { "<leader>on", "<cmd>ObsidianQuickSwitch<cr>", desc = "Search obsidian documents for its name"},
    { "<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "Follow wikilink"},
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Open backlinks"},
  }
}

