" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set background=light
filetype on
syntax on
set nu
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
"set splitright
"set splitbelow
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let g:ycm_collect_identifiers_from_tags_files = 1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'slim-template/vim-slim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" For split window resizing
nmap <F2> <C-W>=
nmap <F3> <C-W>_<C-W>\|
nmap <S-Left> 10<C-W><
nmap <S-Right> 10<C-W>>
nmap <S-Up> 10<C-W>-
nmap <S-Down> 10<C-W>+
nmap <C-W>w <C-W>w130<C-W>\|<C-W>_
nmap <C-W><C-W> <C-W>w130<C-W>\|<C-W>_
nmap <C-B> :Gblame<Enter>
nmap <C-C> :Rtags<Enter>
nmap <C-N> :tn<Enter>
nmap <C-L> :tp<Enter>

" For Visual Line mode stuff
vmap <TAB> >
vmap <S-TAB> <
vmap ## ::s/^\(\s*\)/\1# /<Enter>
vmap #/ ::s/^\(\s*\)/\1\/\/ /<Enter>
vmap @ ::!awk '{print substr($0, index($0, $2))}'<Enter>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  "  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " filetype plugin indent on

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

 " set autoindent		" always set autoindenting on

endif " has("autocmd")

autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
highlight Pmenu ctermbg=black ctermfg=blue
