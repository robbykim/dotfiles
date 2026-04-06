return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = {
    {
      "<leader>oo",
      function()
        vim.cmd("split")
        vim.cmd("ObsidianQuickSwitch")
      end,
      desc = "Open Obsidian note in vsplit",
    },
    {
      "<leader>on",
      function()
        vim.cmd("split")
        vim.cmd("ObsidianNew")
      end,
      desc = "New Obsidian note in vsplit",
    },
    {
      "<leader>os",
      "<cmd>ObsidianSearch<cr>",
      desc = "Search Obsidian vault",
    },
    {
      "<leader>ot",
      function()
        vim.cmd("split")
        vim.cmd("ObsidianToday")
      end,
      desc = "Open today's daily note in vsplit",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Second Brain",
        path = "~/Documents/Obsidian/Second Brain",
      },
    },
  },
}
