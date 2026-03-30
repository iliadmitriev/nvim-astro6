-- Highlight git conflict markers
-- Hotkeys for resolving conflicts
-- https://github.com/akinsho/git-conflict.nvim
--    co — choose ours
--    ct — choose theirs
--    cb — choose both
--    c0 — choose none
--    ]x — move to previous conflict
--    [x — move to next conflict
--
---@type LazySpec
return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = true,
}
