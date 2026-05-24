return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = false,
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, _, _)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      }
    }
  },
}
