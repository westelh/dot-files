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
  cmd = cmds,
  ft = "markdown",
  version = "*", -- recommended, use latest release instead of latest commit
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp" -- for completion of note references.
  },
  opts = {
    workspaces = {
      {
        name = "Vault",
        path = "~/Documents/Vault",
      },
    },
  },
}

