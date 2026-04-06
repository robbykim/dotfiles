return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec")({
          rspec_cmd = function()
            return vim.tbl_flatten({
              "docker",
              "exec",
              "-it",
              vim.fn.system("basename $(pwd)"):gsub("\n", "") .. "-app-1",
              "bundle",
              "exec",
              "rspec",
            })
          end,

          transform_spec_path = function(path)
            local prefix = require('neotest-rspec').root(path)
            return string.sub(path, string.len(prefix) + 2, -1)
          end,

          results_path = "tmp/rspec.output",
          formatter = "json"
        }),
      },
    })
  end,
  keys = {
    { "<leader>tn", function() require("neotest").run.run() end, desc = "Test Nearest" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test File" },
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test Output" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test Summary" },
  },
}
