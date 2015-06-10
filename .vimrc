set nocompatible

execute pathogen#infect()

syntax enable
syntax on
filetype plugin on

"if &term == "xterm"
"let base16colorspace=256
"set t_Co=256
"endif

set nowrap

set showmode
set encoding=utf-8

set ruler
set number

set shiftwidth=4

set hlsearch
"set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scheme settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
    set background=light
else
    set background=dark
endif

set t_Co=16
colorscheme solarized
set listchars=eol:$,tab:>-,trail:·,extends:»,precedes:«

set laststatus=2

"Invisable charater color
highlight NonText guifg=black guibg=magenta ctermfg=black ctermbg=magenta
highlight SpecialKey guifg=black guibg=magenta ctermfg=black ctermbg=magenta

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
hi CursorLine cterm=NONE ctermbg=236 ctermfg=none guibg=darkgrey guifg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fold  setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set fdm=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tag setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
"set expandtab
set autoindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;
set autochdir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set for ctags 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tlist setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos ="right"
let NERDTreeShowBookmarks=1
let NERDTreeBookmarksFile=$vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set cscopetag cscopeverbose
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()


"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
