set nocompatible    " Use Vim defaults (much better!)

" Enable tpope's vim-pathogen
call pathogen#infect()
call pathogen#helptags()

set printoptions=paper:letter
set ts=2
set background=light
colorscheme flatui "slate tango tango2 tango-morning two2tango 

map ; :
noremap ;; ;

set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers

set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " incremental searching
set showmatch

set hidden " Buffer magic stuff
set title

" PowerLine magic
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" enable mouse
if has("mouse")
  set mouse=a
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

set noautoindent

set textwidth=70
"Wrap at this column

set backspace=indent,eol,start
"Make backspaces delete sensibly

set tabstop=2
"Indentation levels every four columns

set shiftwidth=2
"Indent/outdent by four columns

set shiftround
"Indent/outdent to nearest tabstop

set matchpairs+=<:>
"Allow % to bounce between angles too

set ignorecase
set smartcase " if pattern contains uppercase, override

set nobackup

" disable any bells or visual indication
set novisualbell
set noerrorbells
set vb t_vb=

set binary noeol

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  autocmd GUIEnter * set vb t_vb=
endif

" expand tabs into spaces for these file types
autocmd BufNewFile,BufRead *.java setlocal expandtab
autocmd BufNewFile,BufRead *.c setlocal expandtab
autocmd BufNewFile,BufRead *.cc setlocal expandtab
autocmd BufNewFile,BufRead *.cpp setlocal expandtab
autocmd BufNewFile,BufRead *.h setlocal expandtab
autocmd BufNewFile,BufRead *.hh setlocal expandtab
autocmd BufNewFile,BufRead *.hpp setlocal expandtab
autocmd BufNewFile,BufRead *.xml setlocal expandtab
autocmd BufNewFile,BufRead *.sql setlocal expandtab
"autocmd BufNewFile,BufRead *.py setlocal expandtab
"autocmd BufNewFile,BufRead *.pl setlocal expandtab
"autocmd BufNewFile,BufRead *.pm setlocal expandtab

" set a reasonable search color
highlight search guibg=Red
highlight search ctermbg=Red
"
map <F2> :%!perltidy<C-M>
set cindent
set number

" Status line options
set laststatus=2

" Custom leader
let mapleader = ";"
" Gundo toggle
map <leader>g :GundoToggle<CR>

" Map lnext and lprev (for syntastic)
map <leader>ln :lnext<CR>
map <leader>lp :lprev<CR>

" show taglist
map <leader>tl :TlistToggle<CR>

" diff options
set diffopt+=iwhite

"filetype plugin on
filetype indent on

" vim-latex config
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Stop YCM from working in tex files
let g:ycm_filetype_blacklist = {'tex' : 0, 'mkd' : 0, 'gitcommit' : 0}


" sane regex {{{
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v
" }}}

