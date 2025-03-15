set nocompatible

runtime macros/matchit.vim

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plug packages
call plug#begin('~/.vim/plugged')

" fully functional utilities
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" auto-complete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" visual plugins
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-rails'
Plug 'elzr/vim-json'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'noprompt/vim-yardoc'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" autocompletion
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'

" command utilities
Plug 'tpope/vim-surround'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'thoughtbot/vim-rspec'
Plug 'ngmy/vim-rubocop'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" ---------------------------------
" VISUAL CONFIG
" ---------------------------------
set background=dark
autocmd vimenter * ++nested colorscheme solarized8_flat
filetype plugin indent on
syntax enable
set noshowmode

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component_function': {
      \    'filename': 'FilenameForLightline'
      \  },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '◣ ', 'right': '◀' },
      \ 'subseparator': { 'left': ' ', 'right': '|' }
      \ }

" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction

" ---------------------------------
" GENERAL USE CONFIG
" ---------------------------------
set hidden
set encoding=UTF-8

" command line completion
set path+=**
set wildmenu
set wildignore=**/node_modules/**,*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db " Ignore these files, obviously

set showcmd

" Searches
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start

" Usability options
set autoindent
set mouse=a
set nowrap

set nostartofline

set confirm
set visualbell " might turn off
set cmdheight=2

" Display line numbers on the left
set number
set relativenumber
set numberwidth=1

" Quickly time out keycodes but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Indentation options
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2

" Split opening
set splitbelow
set splitright

set undodir=~/.vim/undo//

set autoread

" No Tabs, and no Trailing Whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" ---------------------------------
" KEY BINDINGS
" ---------------------------------
let mapleader = ","

" vimrc bindings
nnoremap <Leader>ev :vsplit ~/.vimrc<cr>
nnoremap <Leader>sv :source ~/.vimrc<cr>

" semicolon to colon
nnoremap ; :

" copy/paste to clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
" yank entire file
noremap <Leader>Y :%y*<cr>

" Easier Split Navigation
map <silent> <Leader>e :tabe ./
map <silent> <Leader>vv <C-w>v
map <silent> <Leader>ss <C-w>s

" ctrlp mappings
noremap <Leader>bb :Buffers<cr>
map <silent> <Leader><Space> :noh<CR>

nnoremap <silent> <C-M> :bnext<CR>
nnoremap <silent> <C-N> :bprev<CR>
nnoremap <silent> <Leader>ww :bp<BAR>bd#<cr>
nnoremap <silent> <Leader>bda :%bdelete<bar>edit #<bar>normal `"<cr>

" --------------------------------------
" Plugin Configs
" --------------------------------------
"
" -- FZF --
" map ctrl-p to fzf
nmap <C-P> :FZF<CR>
let g:fzf_layout = { 'down': '30%' }
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" -- RSpec --
" NOTE: figure out how to run via docker
map <Leader>t :call RunCurrentSpecFile()<CR>

" -- Tmux --
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" -- NERDTree --
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
let g:webdevicons_enable_nerdtree = 1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 45

" Auto open nerd tree on startup
" let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" -- vim rubocop --
let g:vimrubocop_config = './.rubocop.yml'
map <Leader>rb :RuboCop<CR>

" -- Git --
nnoremap <silent> <Leader>gb :Git blame<cr>

" -- ripgrep --
set grepprg=rg\ --color=never
