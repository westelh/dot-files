local lazygit = nil
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<c-\>]],
  },
  init = function ()
    lazygit = require'toggleterm.terminal'.Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "double",
      },
    })
  end,
  keys = {
    { [[<c-\>]] },
    { "<leader>g", function() lazygit:toggle() end },
  }
}
