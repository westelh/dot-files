-- Neovide
if vim.g.neovide then
  vim.o.guifont = "PlemolJP35_Console_NF:h14"

  -- GUI does not have osc52 reader
  vim.g.clipboard = "pbcopy"
  vim.o.clipboard = "unnamedplus"
end
