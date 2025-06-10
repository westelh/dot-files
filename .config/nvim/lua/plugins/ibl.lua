return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  keys = {
    { "<leader>ti", "<cmd>IBLToggle<cr>", desc = "Toggle Indent Highlights" },
    { "<leader>ts", "<cmd>IBLToggleScope<cr>", desc = "Toggle Scope Highlights" },
  },
  cmd = {
    "IBLEnable",
    "IBLDisable",
    "IBLToggle",
    "IBLEnableScope",
    "IBLDisableScope",
    "IBLToggleScope",
  },
}
