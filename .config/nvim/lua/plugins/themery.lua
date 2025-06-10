return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        {
          name = "Solarized Dark",
          colorscheme = "solarized",
          before = [[
            vim.o.termguicolors = true
            vim.o.background = 'dark'
          ]],
        },
        {
          name = "Tokyo Moon",
          colorscheme = "tokyonight-moon"
        },
        {
          name = "Tokyo Night",
          colorscheme = "tokyonight-night"
        },
        {
          name = "Tokyo Storm",
          colorscheme = "tokyonight-storm",
        },
        {
          name = "Tokyo Day",
          colorscheme = "tokyonight-day",
        },
      }
    })
  end
}
