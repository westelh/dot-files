return {
  'nvim-mini/mini.starter',
  lazy = false, -- load immediately so the dashboard is ready on start
  config = function()
    local starter = require('mini.starter')

    starter.setup({
      evaluate_single = true,
      header = 'Welcome!',
      items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(10, false),
      },
      footer = '\nPress ? for help',
    })

    -- Neovide opens files from Finder in a new tab after VimEnter, leaving the starter tab behind
    if vim.g.neovide then
      vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(args)
          if vim.fn.argc() == 0 or vim.bo[args.buf].filetype == 'ministarter' then return end
          vim.schedule(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.bo[buf].filetype == 'ministarter' then starter.close(buf) end
            end
          end)
          return true
        end,
      })
    end
  end,
}
