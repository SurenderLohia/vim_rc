filetype plugin indent on " Filetype plugin on
syntax on " Syntax on
set encoding=utf-8 " Encoding

set noswapfile " no swap file (backup file)

" Tabs
set expandtab    " expand tab
set shiftwidth=2 " shift tab
set softtabstop=2 " soft tab stop


" set line numbers
set number  " set number 
set relativenumber " set relative number

" color theme
" let g:solarized_termcolors=256
syntax enable
" set background=dark
colorscheme desert " solarized

" Auto command
autocmd BufRead,BufNewFile *.md setlocal spell " set spell check for .md files
autocmd FileType gitcommit setlocal spell     " set spell check for git commit files
set complete+=kspell " set auto spell complete


" Key maps
inoremap jk <Esc>

" Key maps with leader
let mapleader = "\<Space>"  " Leader key

nnoremap <leader>ev :vsplit $MYVIMRC<cr> " open .vimrc file in v split mode
nnoremap <leader>sv :source $MYVIMRC<cr> " source (reload) .vimrc

" Set clipboard paste with indent
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" makes f and t work across multiple lines
nmap <silent> f :call FindChar(0, 0, 0)<cr>
omap <silent> f :call FindChar(0, 1, 0)<cr>
nmap <silent> F :call FindChar(1, 0, 0)<cr>
omap <silent> F :call FindChar(1, 1, 0)<cr>
nmap <silent> t :call FindChar(0, 0, 1)<cr>
omap <silent> t :call FindChar(0, 0, 0)<cr>
nmap <silent> T :call FindChar(1, 0, 1)<cr>
omap <silent> T :call FindChar(1, 0, 0)<cr>

"Functions
fun! FindChar(back, inclusive, exclusive)
  let flag = 'W' 
  if a:back
    let flag = 'Wb'
  endif
  if search('\V' . nr2char(getchar()), flag)
    if a:inclusive
      norm! l
    endif
    if a:exclusive
      norm! h
    endif
  endif
endfun
