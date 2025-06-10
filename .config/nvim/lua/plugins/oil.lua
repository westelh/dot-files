return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
  },
  -- Optional dependencies
  dependencies = {
    { "echasnovski/mini.icons",     opts = {} },
    { "nvim-tree/nvim-web-devicons" }
  },
  keys = {
    { "<leader>o", "<cmd>Oil --float<cr>", desc = "Open Oil" },
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
