local node_modules_path = nil
if vim.env.N_PREFIX then
  -- node_modules_path is '$N_PREFIX/lib/node_modules' when $N_PREFIX exists
  node_modules_path = vim.env.N_PREFIX .. '/lib/node_modules'
else
  node_modules_path = '/usr/lib/node_modules'
end

local vue_language_server_path = node_modules_path .. '/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

return {
  init_options = {
    plugins = {
      vue_plugin,
    }
  },
  on_attach = function(client, bufnr)
    -- フォーマット機能をオフにして競合防止
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  filetypes = tsserver_filetypes,
}
