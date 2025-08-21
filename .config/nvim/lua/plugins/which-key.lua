return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  version = "v3.*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show()
      end,
      desc = "Show global keymaps",
    },
    {
      "<leader>\\",
      function()
        require("which-key").show({global=false})
      end,
      desc = "Show buffer local keymaps",
    },
  },
  config = function()
    local wk = require("which-key")

    -- Hint of nested key mapping
    wk.add({
      { "<leader>q", group = "Global Obsidian Commands" },
      { "<leader>h", group = "Git hunk operations" },
      { "<leader>l", group = "Lazy git" },
      { "<leader>s", group = "Snippets" },
      { "<leader>t", group = "Toggle" },
      { "<leader>x", group = "Diagnostics" },
    })
  end,
}

