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
