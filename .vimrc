" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" lchen
set nobackup
set nohls
set tabstop=4
set shiftwidth=4
"set noincsearch
set expandtab
set softtabstop=4
if filereadable("./net/core/dev.c")
set tabstop=8
set shiftwidth=8
set noexpandtab
set softtabstop=8
endif

" conf for tabs
let mapleader = ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>

set cscopequickfix=s-,g-,c-,d-,i-,t-,e-,f-
if filereadable("./cscope.out")
    cs add ./cscope.out
endif

nmap _s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap _g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap _c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap _t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap _e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap _f :cs find f <C-R>=expand("<cword>")<CR><CR>
"nmap _i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap _i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap _d :cs find d <C-R>=expand("<cword>")<CR><CR>

"set tags=~/ird/cmw/tags,~/ird/Vpro/tags,~/ird/71xxlinuxref_1.1.0/tags,~/panel/tags
set tags=tags,./tags
set t_Co=8
"set t_Co=256
set mouse=nvchr
set number
set ignorecase
set autoread " auto read the file modified outside vim

let Tlist_Show_One_File=1
"let Tlist_Use_Right_Window=1
"let loaded_matchparen=0  " not highlighting matched (){}[]...
let NERDTreeQuitOnOpen=1
let NERDTreeWinPos="right"

set completeopt=longest,menu
"set completeopt=preview

" lookup file settings
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
    let g:LookupFile_TagExpr = '"./filenametags"'
endif

" gvim setting 
highlight Normal guibg=#01092E guifg=#EFEFEF
set guifont=Bitstream\ Vera\ Sans\ Mono\ 9

set guioptions-=T
set guioptions-=m

" auto pairs
let g:AutoPairsFlyMode = 1

" Python
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:pydiction_location = '~/pydiction/complete-dict'
let g:pydiction_menu_height = 3

" Jedi - more powerfull Python completion
let g:jedi#popup_on_dot = 0 " Only complete when needed, <C-X><C-O>/<C-N>/<C-P>
let g:jedi#show_call_signatures = 0 " it break type-flow

" pathogen
execute pathogen#infect()

" open current file's path, like ':e %:h<tab>'
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" enable matchit.vim (build-in plugin) to use '%' match XML tags
runtime macros/matchit.vim

" markdown (*.md) file
autocmd BufRead,BufNewFile *.md set filetype=markdown

" hilight
highlight CursorLine term=NONE cterm=NONE ctermbg=darkgrey
highlight LineNr ctermbg=darkgrey
set cursorline
highlight Visual term=NONE cterm=NONE ctermbg=darkgrey
highlight Search term=reverse ctermfg=0 ctermbg=grey guibg=Yellow
