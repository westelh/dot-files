return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {
  },
  keys = {
    -- Navigation
    {
      "]c",
      function()
        local gitsigns = require('gitsigns')
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          gitsigns.nav_hunk('next')
        end
      end,
      desc = "Navigate to next hunk"
    },
    {
      "[c",
      function()
        local gitsigns = require('gitsigns')
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          gitsigns.nav_hunk('prev')
        end
      end,
      desc = "Navigate to prev hunk"
    },
    -- Actions
    { "<leader>hs", function() require('gitsigns').stage_hunk() end, desc = "Stage hunk" },
    { "<leader>hr", function() require('gitsigns').reset_hunk() end, desc = "Reset hunk" },

    { mode = "v", "<leader>hs", function()
        require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end,
      desc = "Stage selected hunk"
    },
    { mode = "v", "<leader>hr", function()
        require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end,
      desc = "Reset selected hunk"
    },

    { "<leader>hS", function() require('gitsigns').stage_buffer() end, desc = "Stage buffer" },
    { "<leader>hR", function() require('gitsigns').reset_buffer() end, desc = "Reset buffer" },
    { "<leader>hp", function() require('gitsigns').preview_hunk() end, desc = "Preview hunk" },
    { "<leader>hi", function() require('gitsigns').preview_hunk_inline() end, desc = "Preview hunk inline" },

    { "<leader>hb", function() require('gitsigns').blame_line({ full = true }) end, desc = "Blame line" },

    { "<leader>hd", function() require('gitsigns').diffthis() end, desc = "Diff with index" },
    { "<leader>hD", function() require('gitsigns').diffthis('~') end, desc = "Diff with last commit" },

    { "<leader>hQ", function() require('gitsigns').setqflist('all') end, desc = "Populate qf list" },
    { "<leader>hq", function() require('gitsigns').setqflist() end, desc = "Remove qf list" },

    -- Toggles
    { "<leader>tb", function() require('gitsigns').toggle_current_line_blame() end , desc = "Toggle current line blame"},
    { "<leader>tw", function() require('gitsigns').toggle_word_diff() end , desc = "Toggle word diff"},

    { mode = {'o', 'x'}, "ih", function() require('gitsigns').select_hunk() end , desc = "Select hunk"},
  }
}

