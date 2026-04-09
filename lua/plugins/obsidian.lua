return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = {
    {
      "<leader>oo",
      function()
        vim.cmd("15split")
        vim.cmd("ObsidianQuickSwitch")
      end,
      desc = "Open Obsidian note in split",
    },
    {
      "<leader>on",
      function()
        vim.cmd("15split")
        vim.cmd("ObsidianNew")
      end,
      desc = "New Obsidian note in split",
    },
    {
      "<leader>os",
      "<cmd>ObsidianSearch<cr>",
      desc = "Search Obsidian vault",
    },
    {
      "<leader>ot",
      function()
        vim.cmd("15split")
        vim.cmd("ObsidianToday")
      end,
      desc = "Open today's daily note in split",
    },
    {
      "<leader>oi",
      function()
        local height = vim.api.nvim_win_get_height(0)
        if height > 15 then
          vim.cmd("resize 15")
        else
          local total = vim.o.lines
          vim.cmd("resize " .. math.floor(total * 0.75))
        end
      end,
      desc = "Toggle obsidian split size",
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
