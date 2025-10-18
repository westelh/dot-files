---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  lazy = false,

  config = function()
    -- Terraform
    vim.lsp.config('terraformls', {})
    vim.lsp.enable('terraformls')

    -- Helm
    vim.lsp.config('helm_ls', {})
    vim.lsp.enable('helm_ls')

    -- Github Actions
    vim.lsp.config('gh_actions_ls', {})
    vim.lsp.enable('gh_actions_ls')

    -- Yaml
    vim.lsp.config('yamlls', {})
    vim.lsp.enable('yamlls')

    -- Lua
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } }
        }
      },
    })
    vim.lsp.enable('lua_ls')

    local n_prefix = vim.env.N_PREFIX
    local vue_language_server_path = n_prefix .. '/lib/node_modules/@vue/language-server'
    local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
    local vue_plugin = {
      name = '@vue/typescript-plugin',
      location = vue_language_server_path,
      languages = { 'vue' },
      configNamespace = 'typescript',
    }
    local ts_ls_config = {
      init_options = {
        plugins = {
          vue_plugin,
        },
      },
      on_attach = function(client, bufnr)
        -- フォーマット機能をオフにして競合防止
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      filetypes = tsserver_filetypes,
    }
    vim.lsp.config('ts_ls', ts_ls_config)

    -- Javascript and Typescript
    vim.lsp.enable('ts_ls')
    -- Vue
    vim.lsp.config('vue_ls', {})
    vim.lsp.enable('vue_ls')

    vim.lsp.config('eslint', {})
    vim.lsp.enable('eslint')
  end
}
