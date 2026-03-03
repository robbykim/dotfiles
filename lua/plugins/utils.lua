return {
  'rust-lang/rust.vim',
  'tpope/vim-rails',
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'noprompt/vim-yardoc',
  {
    'ngmy/vim-rubocop',
    init = function()
      vim.g.vimrubocop_config = './.rubocop.yml'
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },
  'preservim/vimux',
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
