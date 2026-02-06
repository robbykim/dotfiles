return {
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
}
