-- Neovide
if vim.g.neovide then
  vim.o.guifont = "PlemolJP35_Console_NF:h14"

  -- +,*レジスタ経由でシステムクリップボードと同期
  vim.o.clipboard = "unnamed,unnamedplus"

  -- 環境ごとにツールをオーバーライド
  if vim.fn.has('mac') == 1 then
    vim.g.clipboard = "pbcopy"
  end
  if vim.fn.has('win32') == 1 then
    vim.g.clipboard = "win32yank"
  end
end
