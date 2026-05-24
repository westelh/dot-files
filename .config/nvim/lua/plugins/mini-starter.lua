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
  end,
}
