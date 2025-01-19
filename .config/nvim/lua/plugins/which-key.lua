return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    {
      "?",
      function()
        require("which-key").show()
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

