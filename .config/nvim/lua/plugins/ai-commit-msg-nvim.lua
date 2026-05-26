-- https://github.com/aweis89/ai-commit-msg.nvim
-- AI-powered commit message edit

return {
  "aweis89/ai-commit-msg.nvim",
  ft = "gitcommit",
  opts = {
    provider = "openai",
    providers = {
      openai = {
        model = "gpt-5-mini"
      }
    }
  },
}
