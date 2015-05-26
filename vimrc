execute pathogen#infect()

set history=1000

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" " (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 


set encoding=utf8
syntax on
filetype plugin on
set number

colorscheme molokai

" vim-go plugin
let g:go_disable_autoinstall = 0  

" neocomplete vim plugin
" let g:neocomplete#enable_at_startup = 1

" nerdtree plugin
map <C-n> :NERDTreeToggle<CR>

" ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
