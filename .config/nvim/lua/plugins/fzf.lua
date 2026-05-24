return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>f",
      function()
        require('fzf-lua').files()
      end,
      desc = "Fuzzy find Files"
    },
    {
      "<leader>F",
      function()
        require('fzf-lua').builtin()
      end,
      desc = "Fuzzy find Builitin Commands"
    },
  },
  config = function()
    require('fzf-lua').register_ui_select()
  end
}
