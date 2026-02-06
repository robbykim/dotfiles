-- Config file shortcuts
vim.keymap.set('n', '<Leader>ev', ':vsplit ~/.config/nvim/init.lua<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>sv', ':source ~/.config/nvim/init.lua<cr>', { noremap = true })

-- Semicolon to colon
vim.keymap.set('n', ';', ':', { noremap = true })

-- Clipboard operations
vim.keymap.set('n', '<Leader>y', '"*y', { noremap = true })
vim.keymap.set('n', '<Leader>p', '"*p', { noremap = true })
vim.keymap.set('v', '<Leader>y', '"*y', { noremap = true })
vim.keymap.set('v', '<Leader>p', '"*p', { noremap = true })
vim.keymap.set('n', '<Leader>Y', ':%y*<cr>', { noremap = true })

-- Split navigation
vim.keymap.set('n', '<Leader>e', ':tabe ./', { silent = true })
vim.keymap.set('n', '<Leader>vv', '<C-w>v', { silent = true })
vim.keymap.set('n', '<Leader>ss', '<C-w>s', { silent = true })

-- Clear search highlight
vim.keymap.set('n', '<Leader><Space>', ':noh<CR>', { silent = true })

-- Buffer navigation
vim.keymap.set('n', '<C-M>', ':bnext<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-N>', ':bprev<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<Leader>ww', ':bp<BAR>bd#<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<Leader>bda', ':%bdelete<bar>edit #<bar>normal `"<cr>', { silent = true, noremap = true })

-- Background toggle
vim.keymap.set('n', '<Leader>bg', function()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end, { noremap = true })

-- Telescope
vim.keymap.set('n', '<C-P>', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>bb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fo', '<cmd>Telescope oldfiles<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fc', '<cmd>Telescope commands<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fm', '<cmd>Telescope marks<cr>', { noremap = true, silent = true })

-- Neo-tree
vim.keymap.set('n', '<C-t>', ':Neotree toggle<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-f>', ':Neotree reveal<CR>', { silent = true, noremap = true })

-- Tmux Navigator
vim.keymap.set('n', '<c-h>', ':TmuxNavigateLeft<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<c-j>', ':TmuxNavigateDown<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<c-k>', ':TmuxNavigateUp<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<c-l>', ':TmuxNavigateRight<cr>', { silent = true, noremap = true })

-- Vimux
vim.keymap.set('n', '<Leader>rs', function()
  vim.cmd('call VimuxRunCommand("dbe rspec " . bufname("%"))')
end, {})
vim.keymap.set('n', '<Leader>vq', ':VimuxCloseRunner<CR>', {})
vim.keymap.set('n', '<Leader>vo', ':VimuxOpenRunner<CR>', {})

-- RuboCop
vim.keymap.set('n', '<Leader>rb', ':RuboCop<CR>', {})

-- Git
vim.keymap.set('n', '<Leader>gb', ':Git blame<cr>', { silent = true, noremap = true })
