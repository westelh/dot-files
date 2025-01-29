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
}

