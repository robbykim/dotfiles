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
Plug 'slim-template/vim-slim'
Plug 'ngmy/vim-rubocop'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'elzr/vim-json'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'noprompt/vim-yardoc'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rking/ag.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Navigation plugins
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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

" tmux navigator settings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" enable syntax highlighting
syntax enable
filetype plugin indent on


"-----------------------------
" recommended options
"
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

"-----------------------------
" Usability options
"
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

" NERDTree line numbers
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

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

" NERDtree keymaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 30

" Auto open nerd tree on startup
" let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

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

" quick split screening
map <silent> <Leader>e :tabe ./
map <silent> <Leader>vv <C-w>v
map <silent> <Leader>ss <C-w>s

" quick write/close
map <silent> <Leader>wq :wq<CR>

" easier buffer navigation
nnoremap <silent> <Leader>, :bp<cr>
nnoremap <silent> <Leader>. :bn<cr>
nnoremap <silent> <Leader>ww :bp<BAR>bd#<cr>
nnoremap <silent> <Leader>bda :%bdelete<bar>edit #<bar>normal `"<cr>

" ctrlp mappings
noremap <Leader>bb :Buffers<cr>

" clear highlight
map <silent> <Leader><Space> :noh<CR>

" easy vimrc editing
let vimrc_path = "~/.vimrc"    " $MYVIMRC in neovim points to .config/nvim/init.vim
nnoremap <Leader>ev :vsplit ~/.vimrc<cr>
nnoremap <Leader>sv :source ~/.vimrc<cr>

" git
nnoremap <silent> <Leader>gb :Git blame<cr>

"------------------------------------------------------------
" ripgrep
"
set grepprg=rg\ --color=never
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
command! -bang -nargs=* -complete=file Rg Ag<bang> <args>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store,*/log/*,*/bin/*,*/.git/*,*/images/*,*/node_modules/*

" Don't show most recently used files outside current working directory
let g:ctrlp_mruf_relative = 1
let g:ctrlp_cmd = "CtrlPMixed"

"------------------------------------------------------------
" fzf
"
" use fzf vim integration
set rtp+=/opt/homebrew/opt/fzf

" map ctrl-p to fzf
nmap <C-P> :FZF<CR>
let g:fzf_layout = { 'down': '30%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -name tmp -o -name .git \) -prune -o -print'


"------------------------------------------------------------
" Functions and Such

" Stolen from 'More Instantly Better Vim' by Damian Conway
" http://www.youtube.com/watch?v=aHm36-na4-4

" No Tabs, and no Trailing Whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------
" Lightline filename overwrite
"

" Replace filename component of Lightline statusline
 let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component_function': {
      \   'filename': 'FilenameForLightline'
      \ }
      \ }

" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction

"-----------------------------
" Mappings
"

" Ctrl S to save
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>

" Remap Semicolon to Colon
nnoremap ; :

" Resize panes
nmap <silent> <M-Right> :vertical resize +1<CR>
nmap <silent> <M-Left> :vertical resize -1<CR>
nmap <silent> <M-Down> :resize +1<CR>
nmap <silent> <M-Up> :resize -1<CR>

" copy/paste to clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
" yank entire file
noremap <Leader>Y :%y*<cr>

" Coc.vim Section
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" tab autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

