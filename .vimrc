set nocompatible
filetype off
syntax on
set background=light
set number
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set backspace=indent,eol,start  " more powerful backspacing
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

let test#ruby#bundle_exec = 1
let test#strategy = "basic"
let test#javascript#jasmine#executable = "npm test"

" autocmd BufWritePre *.tf silent execute '%!terraform fmt -no-color -'
let g:terraform_align=1
let g:terraform_fmt_on_save=1

au FileType go setl ts=4 sw=4 noexpandtab
let g:go_fmt_command = "goimports"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-system-copy'
Plugin 'Raimondi/delimitMate'
Plugin 'janko-m/vim-test'

call vundle#end()
filetype plugin indent on

" For split window resizing
nmap <F2> <C-W>=
nmap <F3> <C-W>_<C-W>\|
nmap <S-Left> 10<C-W><
nmap <S-Right> 10<C-W>>
nmap <S-Up> 10<C-W>-
nmap <S-Down> 10<C-W>+
nmap <C-W>w <C-W>w130<C-W>\|<C-W>_
nmap <C-W><C-W> <C-W>w130<C-W>\|<C-W>_
nmap <C-B> :Git blame<Enter>
nmap <C-C> :Rtags<Enter>
nmap <C-N> :tn<Enter>
nmap <C-L> :tp<Enter>

" For Visual Line mode stuff
"vmap <TAB> >
"vmap <S-TAB> <
"vmap @ ::!awk '{print substr($0, index($0, $2))}'<Enter>

" For Vim Test stuff
nmap <C-T>t :TestNearest --format documentation<Enter>
nmap <C-T>T :TestFile --format documentation<Enter>

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
