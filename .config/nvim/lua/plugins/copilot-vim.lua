return {
  "github/copilot.vim",
  event = "VeryLazy",
  config = function()
    vim.g.copilot_filetypes = { markdown = 0 }
  end,
}
