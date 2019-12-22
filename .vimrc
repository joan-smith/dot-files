execute pathogen#infect()

"Get out of VI's compatible mode..
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256

"Set some sane defaults
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set cursorline
set laststatus=2
autocmd BufWinEnter * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set mouse=a
nmap ; :

"Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * :silent! !

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Indents
set tabstop=2
set softtabstop=2
set smartindent
set expandtab
set ai
set sw=2

"Text movement
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jk <ESC>
vnoremap jk <ESC>

nnoremap <f1> <esc>
vnoremap <F1> <ESC>

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"Seach Settings
set hlsearch
set ignorecase
set incsearch
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>
let g:ag_qhandler="copen 20"
let g:ag_mappings={ "x": "<C-W><CR><C-W>K" }


nnoremap <leader>n :NERDTree<cr>

let NERDTreeMapCloseDir='c'
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='x'

"tab moves between brackets
nnoremap <tab> %
vnoremap <tab> %

" Files and backups
"Turn backup off
set nobackup
set nowb
set noswapfile

autocmd BufWritePre * :%s/\s\+$//e

" Easier split navigation
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


"Handy Shortcuts
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"Disable Markdown
let g:vim_markdown_folding_disabled=1
