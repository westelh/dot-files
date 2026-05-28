-- https://github.com/romus204/tree-sitter-manager.nvim?utm_source=chatgpt.com
-- Alternates core functionality of archived nvim-treesitter

return {
  'romus204/tree-sitter-manager.nvim',
  opts = {
    -- hilight = { "lua", "c" },
    -- nohighlight = { "lua", "c" },
  },
  cmd = {
    "TSManager",
    "TSUninstall",
  }
}
