set tags=./tags;/
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
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
"git stuff 
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"static analysis/syntax
Plugin 'klen/python-mode'
"autocomplete
Plugin 'Valloric/YouCompleteMe'

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
let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#fugitive#enabled = 1

" nerdtree-tabs settings
let g:nerdtree_tabs_open_on_console_startup=1

" ultisnips settings
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-v>"

"ctrlp settings
map <leader>cp :CtrlPMRUFiles<CR>
noremap <leader>b :CtrlPBuffer<CR>
map <leader>cpu :CtrlPUndo<CR>
map <leader>cpm :CtrlPMixed<CR>

"nerdtree width settings
let g:NERDTreeWinSize=40

"tagbar map key f8 to tagbar
map T ;TagbarToggle<enter>

"python-mode
map lin :PymodeLint<enter>
map lan :PymodeLintAuto<enter>
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 80
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_lint = 1
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pylint','pep8','pyflakes']
let g:pymode_rope = 0 " turn this off else it hangs up vim
let g:pymode_lint_ignore = "E1103,C0301,E501,W0212,F,E1002"
let g:pymode_run = 1

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

" normal mode switch to last used tab
function SwitchBuffer()
  b#
endfunction
nmap <Tab> :call SwitchBuffer()<CR>

set statusline+=%F
" quick window naviagtion vim
map [1;3C <C-W>w
map [1;3D <C-W>W

set hlsearch
"highlight Search ctermfg =yellow  cterm=bold term=reverse guibg=NONE ctermbg = NONE

set relativenumber

" Turn on autosave.
set autowrite

" set quick escape from insert mode
inoremap ;; <Esc>

" Turn on paren high-lighting.
set showmatch

" Turn on autoreading in order to read the latest file everytime its on focus
au CursorMoved * checktime
set autoread

" use console mouse
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

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

" Jeff's cscope settings
if has("cscope")
   set csprg=/usr/bin/cscope
   " change this to 1 to search ctags DBs first
   set csto=1
   "set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
       cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB
   endif
   set csverb
endif

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
