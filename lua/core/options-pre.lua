-- Command line completion
vim.opt.path:append('**')
vim.opt.wildmenu = true
vim.opt.wildignore = '**/node_modules/**,*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db'
vim.opt.showcmd = true

-- Searches
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backspace = 'indent,eol,start'

-- Usability options
vim.opt.autoindent = true
vim.opt.mouse = 'a'
vim.opt.wrap = false
vim.opt.startofline = false
vim.opt.confirm = true
vim.opt.visualbell = true
vim.opt.cmdheight = 2
vim.opt.conceallevel = 1

-- Display line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

-- Timeouts
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 200

-- Indentation
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Misc
vim.opt.undodir = vim.fn.expand('~/.vim/undo//')
vim.opt.autoread = true

-- Show whitespace
vim.opt.listchars = { tab = '»»', trail = '·', nbsp = '~' }
vim.opt.list = true

-- Grep
vim.opt.grepprg = 'rg --color=never'
