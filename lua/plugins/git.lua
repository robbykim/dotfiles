return {
  'tpope/vim-git',
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Navigation
        vim.keymap.set('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true, buffer = bufnr})

        vim.keymap.set('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true, buffer = bufnr})

        -- Actions
        vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {buffer = bufnr})
        vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {buffer = bufnr})
        vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {buffer = bufnr})
      end
    },
  },
}
