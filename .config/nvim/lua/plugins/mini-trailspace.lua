-- https://github.com/nvim-mini/mini.trailspace
-- Highlight & Trim trailing whitespace and empty lines at end of the file

return {
  'nvim-mini/mini.trailspace',

  -- Stable channel
  branch = 'stable',

  -- Highlight always
  lazy = false,

  config = function()
    local trailspace = require('mini.trailspace')

    vim.keymap.set('n', '<leader>lt', function()
      trailspace.trim()
    end, { desc = "Trim all trailing whitespace" })

    vim.keymap.set('n', '<leader>ll', function()
      trailspace.trim_last_lines()
    end, { desc = "Trim trailing empty lines" })
  end
}
