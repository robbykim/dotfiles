set nocompatible

:runtime macros/matchit.vim

" load vim-plug and silently install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" setup plug
"
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-rails'
Plug 'tpope/vim-git'
Plug 'altercation/vim-colors-solarized'
Plug 'thoughtbot/vim-rspec'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock' " depends on vim-textobj-rubyblock
Plug 'ctrlpvim/ctrlp.vim'
Plug 'slim-template/vim-slim'
Plug 'scrooloose/nerdtree'
Plug 'ngmy/vim-rubocop'
Plug 'itchyny/lightline.vim'
Plug 'elzr/vim-json'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'noprompt/vim-yardoc'

call plug#end()

" Plugin settings

let g:vim_json_syntax_conceal = 0
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '◣ ', 'right': '◀' },
      \ 'subseparator': { 'left': ' ', 'right': '|' }
      \ }
set noshowmode

" enable syntax highlighting
syntax enable
filetype plugin indent on


"-----------------------------
" recommended options
"
set hidden

" command line completion
set wildmenu
set showcmd

" Searches
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start

"-----------------------------
" Usability options
"
set autoindent

set nostartofline

set confirm
set visualbell " might turn off
set cmdheight=2

" Display line numbers on the left
set number
set relativenumber
set numberwidth=1

" Quickly time out on keycodes but never time out on mappings
set notimeout ttimeout ttimeoutlen=200


"-----------------------------
" Indentation options
"
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2

" Easier Split Navigation

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split opening

set splitbelow
set splitright

set undodir=~/.vim/undo//

set autoread

"-----------------------------
" Colors
"

set background=dark
colorscheme solarized

"-----------------------------
" Leader
"
let mapleader = ","
let g:vimrubocop_config = './.rubocop.yml'

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
map <Leader>rb :RuboCop<CR>
map <Leader>sp :setlocal spell! spelllang=en_us<CR>

map <Leader>e :tabe ./
map <Leader>he :sp ./
map <Leader>ve :vsp ./


"------------------------------------------------------------
" Functions and Such

" Stolen from 'More Instantly Better Vim' by Damian Conway
" http://www.youtube.com/watch?v=aHm36-na4-4
"


" Highlight the 81st character to identify long lines
" highlight ColorColumn ctermbg=blue
" call matchadd('ColorColumn','\%81v',100)

" No Tabs, and no Trailing Whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db " Ignore these files, obviously

" Automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------
" Mappings
"

" Clear last search highlight
nnoremap <Space> :noh<cr>

" Ctrl S to save
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>

" Remap Semicolon to Colon
nnoremap ; :

