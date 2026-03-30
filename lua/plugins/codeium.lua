if vim.env.WORK then return {} end

---@type LazySpec
return {

  -- codeium
  {
    "Exafunction/windsurf.nvim",
    cmd = "Codeium",
    event = "InsertEnter",
    -- build = ":Codeium Auth",
    requires = {
      "nvim-lua/plenary.nvim",
      -- "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
          map_keys = true,
          key_bindings = {
            accept = "<Tab>", -- handled by nvim-cmp / blink.cmp
            accept_line = "<S-Tab>",
            clear = "<C-c>",
            next = "<M-]>",
            prev = "<M-[>",
          },
        },
      }
    end,
  },

  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = {
      {
        "Exafunction/windsurf.nvim",
      },
    },
    opts = {
      sources = {
        default = { "codeium", "lsp", "path", "snippets", "buffer" },
        providers = {
          codeium = { name = "Codeium", module = "codeium.blink", async = true },
        },
      },

      keymap = {
        ["<Tab>"] = {},
        ["<S-Tab>"] = {},
      },
    },
  },
}
