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
          diagnostics = { globals = { "vim" }}
        }
      },
    })
    vim.lsp.enable('lua_ls')

    -- Javascript and Typescript
    vim.lsp.enable('ts_ls')
  end
}

