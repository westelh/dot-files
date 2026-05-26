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
    vim.lsp.enable('lua_ls')

    -- Javascript and Typescript
    vim.lsp.enable('ts_ls')
    -- Vue
    vim.lsp.config('vue_ls', {})
    vim.lsp.enable('vue_ls')

    vim.lsp.config('eslint', {})
    vim.lsp.enable('eslint')
  end
}
