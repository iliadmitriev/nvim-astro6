---@type LazySpec
return {
  {
    "nvim-neotest/neotest-python",
    lazy = true,
    optional = true,
    ---@type neotest-python.AdapterConfig
    opts = {
      dap = {
        justMyCode = false,
      },
    },
  },
}
