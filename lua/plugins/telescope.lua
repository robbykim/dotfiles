return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    }
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          height = 0.4,
          width = 0.9,
          prompt_position = "top",
          preview_width = 0.5,
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<esc>"] = actions.close,
          },
        },
        file_ignore_patterns = {
          "node_modules",
          "%.git/",
          "%.DS_Store",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    pcall(telescope.load_extension, 'fzf')
  end,
}
