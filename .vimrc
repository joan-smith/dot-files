execute pathogen#infect()

"Get out of VI's compatible mode..
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme solarized
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
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set ai

"Text movement
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

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

runtime macros/matchit.vim
filetype plugin on
if has("autocmd")
  filetype indent plugin on
endif


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


"##############################################################################
" Homegrown functions
"##############################################################################

command Json execute "%!python -m json.tool"

" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

augroup BufNewFileFromTemplate
	au!
	autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
	autocmd BufNewFile * %substitute#DATE#\=strftime("%Y %b %d")#ge
	autocmd BufNewFile * %substitute#YEAR#\=strftime("%Y")#ge
	autocmd BufNewFile * %substitute#FILE#\=expand('%:t')#ge
	autocmd BufNewFile * normal! G"_dd1G
	autocmd BufNewFile * silent! match Todo /TODO/
	augroup BufNewFileFromTemplate
augroup END

" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
	  if &modified
	      let save_cursor = getpos(".")
	          let n = min([20, line("$")])
		      keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
		                \ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
				    call histdel('search', -1)
				        call setpos('.', save_cursor)
					  endif
					  endfun
					  autocmd BufWritePre * call LastModified()
