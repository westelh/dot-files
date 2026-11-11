require("config.lazy")
require('config.lsp')
require('config.neovide')
require('config.keymap')
require('config.folding')
require('config.filetype')
require('config.autocmd')
-- require('config.sessions')

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.number = true
vim.o.list = true
vim.o.ambiwidth = 'single'
vim.o.conceallevel = 1
vim.o.clipboard = 'unnamed,unnamedplus'
vim.cmd 'syntax enable'

-- バイナリと巨大ファイルを誤って上書きしないよう編集不可で開く
local max_size = 50 * 1024 * 1024
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local path = vim.api.nvim_buf_get_name(args.buf)
    local stat = vim.uv.fs_stat(path)
    if not stat or stat.type ~= 'file' then return end
    local f = io.open(path, 'rb')
    local head = f and f:read(8192) or ''
    if f then f:close() end
    local reason
    if stat.size > max_size then
      reason = '50MB を超えるファイル'
    elseif head:find('\0', 1, true) then
      reason = 'バイナリファイル'
    end
    if not reason then return end
    vim.bo[args.buf].readonly = true
    vim.bo[args.buf].modifiable = false
    vim.schedule(function()
      vim.notify(reason .. 'のため編集不可で開きました: ' .. vim.fn.fnamemodify(path, ':t'), vim.log.levels.WARN)
    end)
  end,
})
