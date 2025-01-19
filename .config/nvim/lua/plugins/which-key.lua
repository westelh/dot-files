return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    {
      "<leader>s",
      function()
        require("which-key").show()
      end,
      desc = "Keymaps (which-key)",
    },
    {
      "<leader>S",
      function()
        require("which-key").show({global=false})
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

