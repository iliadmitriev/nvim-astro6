---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", function() require("snacks.picker").explorer() end, desc = "File Explorer" },
    },
    ---@type snacks.Config
    opts = {
      explorer = {},
      image = {

        doc = {
          enabled = true,
          inline = false,
          float = true,
          max_width = 20,
          max_height = 10,
        },
      },
      math = {
        enabled = false, -- `Thiago4532/mdmath.nvim` doing this way more better, rendering images
      },
      dashboard = {

        preset = {

          header = table.concat({
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
          }, "\n"),

          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { pane = 1, section = "header" },
          { pane = 1, section = "keys", gap = 1, padding = 1 },
          { pane = 1, section = "startup" },

          { pane = 2, icon = " ", title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 0 },
          { pane = 2, section = "recent_files", cwd = true, limit = 5, padding = 1, indent = 2 },
          {
            pane = 2,
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            limit = 10,
            indent = 2,
            padding = 1,
          },
          { pane = 2, icon = " ", title = "Projects", section = "projects", limit = 10, indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function() return require("snacks").git.get_root() ~= nil end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
            -- key = "gb",
            -- action = function() require("snacks").gitbrowse() end,
          },
        },
      },
      picker = {
        sources = {
          explorer = {},
        },
      },
    },
  },
}
