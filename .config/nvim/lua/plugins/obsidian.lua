-- https://github.com/epwalsh/obsidian.nvim
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
  keys = {
    { "<leader>o", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian documents"},
    { "<leader>n", "<cmd>ObsidianNew<cr>", desc = "Create new Obsidian document"},
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
      },
      ["<localleader>l"] = {
        action = "<cmd>ObsidianLinks<cr>",
        opts = { buffer = true, desc = "List the all links on this document" },
      },
    },
    note_frontmatter_func = function(note)
      if note.title then
        note:add_alias(note.title)
      end
      local out = { id = note.id, aliases = note.aliases, tags = note.tags, title = note.title }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
    follow_url_func = function(url)
      local system = require("config.system")
      system.open(url)
    end
  },
}

