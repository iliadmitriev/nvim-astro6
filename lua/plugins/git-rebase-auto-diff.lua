-- Diff view for git rebase operation

---@type LazySpec
return {
  "yutkat/git-rebase-auto-diff.nvim",
  ft = { "gitrebase" },
  config = function() require("git-rebase-auto-diff").setup() end,
}
