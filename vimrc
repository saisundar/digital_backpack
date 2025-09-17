set tags=tags,./tags;$HOME
"set tags=./TAGS;/

"VUNDLE STUFF ======= PLUGINNNNNN
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"status line/color-schemes/navigation
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
"git stuff
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"static analysis/syntax
Plugin 'nvie/vim-flake8'
"autocomplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'sickill/vim-monokai'

Plugin 'scrooloose/nerdcommenter'
Plugin 'henrik/vim-indexed-search'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief hep
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"syntax on
"filetype plugin indent on

" Set minimum syntax keyword length.
" AirLine settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_theme = 'simple'
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#fugitive#enabled = 1

" ultisnips settings
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-v>"

"Flake8 settings
let g:flake8_show_in_file=1
map <leader>fl :call Flake8()<CR>

" YCM settings
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"ctrlp settings
map <leader>cp :CtrlPMRUFiles<CR>
noremap <leader>b :CtrlPBuffer<CR>
map <leader>cpm :CtrlPMixed<CR>
nnoremap <leader>ct :CtrlPTag<cr>

"nerdtree width settings
let g:NERDTreeWinSize=40

"tagbar map key f8 to tagbar
map T ;TagbarToggle<enter>
let g:tagbar_autoclose=1
let g:easytags_dynamic_files=1
let g:easytags_async=1
let g:easytags_syntax_keyword = 'always'
let g:easytags_on_cursorhold = 0
map <leader>tg :UpdateTags<CR>

"set spell spelllang=en_us
"Fugitive settings
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame -w<CR>
map <leader>gw :Gwrite<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>

" generic settings-----soois
set nu
command WQ wq
command Wq wq
command W w
command Q q
command Cs cs

set updatetime=100

" normal mode switch to last used tab
function SwitchBuffer()
  b#
endfunction
nmap <Tab> :call SwitchBuffer()<CR>

" quick window naviagtion vim
map [1;3C <C-W>w
map [1;3D <C-W>W

set hlsearch
"highlight Search ctermfg =yellow  cterm=bold term=reverse guibg=NONE ctermbg = NONE

set relativenumber

" Turn on autosave.
set autowrite
set noswapfile

" set quick escape from insert mode
inoremap ;; <Esc>
nnoremap <F8> :let _s=@/<Bar>:%s/;\s\+$/;/e<Bar>:let @/=_s<Bar><CR>

" Turn on paren high-lighting.
set showmatch

" Turn on autoreading in order to read the latest file everytime its on focus
au CursorMoved * checktime
set autoread

" use console mouse
set mouse+=a
set ttymouse=sgr

set laststatus=2

" use cursor line highlighting
colorscheme Monokai

" reset the cscope connection
"function UpdateCscope()
"       !cscope -qRb
"       cs restart
"endfunction
"command CUP call UpdateCscope()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=100          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set textwidth=85

 "Jeff's cscope settings
"if has("cscope")
   "set csprg=/usr/bin/cscope
    "change this to 1 to search ctags DBs first
   "set csto=1
   "set cst
   "set nocsverb
    "add any database in current directory
   "if filereadable("cscope.out")
       "cs add cscope.out
    "else add database pointed to by environment
   "elseif $CSCOPE_DB != ""
       "cs add $CSCOPE_DB
   "endif
   "set csverb
"endif

set autoindent
" Set quick command mode from normal mode.
map ; :

" Set quick save from command mode.
map S ;w<enter>
map X ;vsplit<enter>

" Enable the syntax highlighting on enabled terminals.
if &t_Co > 1
syntax enable
endif

" Set tab settings appropriate for source code editing.
"setlocal tabstop=4
"setlocal softtabstop=4
"setlocal shiftwidth=4
"setlocal smarttab
"setlocal expandtab
"setlocal shiftround
"setlocal autoindent
set expandtab      " Tab key indents with spaces
set shiftwidth=4   " auto-indent (e.g. >>) width
set tabstop=4      " display width of a physical tab character
set softtabstop=0  " disable part-tab-part-space tabbing

" Enable incremental search.
set incsearch

" Place the cursor in the center of the screen at all times.
"set scrolloff=999

" Force cursor to be 'near' center of the screen after scrolling down.
set scrolljump=15

" buffer manipulation commands
map [1;2C  ;bnext<enter>
map <F10>  ;enew<enter>
map [1;2D  ;bprev<enter>

"quickfix commands - maps <F5> and <F6> to cnect and cprev on mac
map <F6> ;cnext<enter>
map <F5> ;cprev<enter>
map <F4> ;lnext<enter>
map <F3> ;lprev<enter>

" nerdtree commands
map <F12>  ;NERDTreeToggle<enter>
