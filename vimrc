set nocompatible    " Use Vim defaults (much better!)

set printoptions=paper:letter
set textwidth=70 "Wrap at this column
set list      " Show tabs and newlines
set listchars=tab:▸\ ,eol:¬,trail:█,extends:>,precedes:<
set number

set wildmenu

" Indenting options
set ts=2
set noautoindent
set tabstop=2 "Indentation levels every four columns
set shiftwidth=2 "Indent/outdent by four columns
set shiftround "Indent/outdent to nearest tabstop

set backspace=indent,eol,start "Make backspaces delete sensibly
set matchpairs+=<:> "Allow % to bounce between angles too

set background=light
colorscheme flatui "slate tango tango2 tango-morning two2tango

" enable mouse
if has("mouse")
  set mouse=a
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

map ; :
noremap ;; ;

set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers

set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd " display incomplete commands

" Search options
set incsearch " incremental searching
set showmatch
set ignorecase
set smartcase " if pattern contains uppercase, override
" set a reasonable search color
highlight search guibg=Red
highlight search ctermbg=Red

set hidden " Buffer magic stuff
set title

set nobackup

" disable any bells or visual indication
set novisualbell
set noerrorbells
set vb t_vb=

set binary noeol

" diff options
set diffopt+=iwhite

" sane regex {{{
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v
vnoremap :s/ :s/\v
" }}}

set cindent
filetype plugin on
filetype indent on
set modeline

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
autocmd BufNewFile,BufRead *.c setlocal expandtab
autocmd BufNewFile,BufRead *.cpp setlocal expandtab
autocmd BufNewFile,BufRead *.h setlocal expandtab
autocmd BufNewFile,BufRead *.hpp setlocal expandtab
autocmd BufNewFile,BufRead *.py setlocal expandtab
autocmd BufNewFile,BufRead *.hs setlocal expandtab

" -----------------
" Extension configs
" -----------------

" Enable tpope's vim-pathogen
call pathogen#infect()
call pathogen#helptags()

" PowerLine magic
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'

" Status line options
set laststatus=2

" Map lnext and lprev (for syntastic)
map <leader>ln :lnext<CR>
map <leader>lp :lprev<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ignore some annoying LaTeX warnings from syntastic
let g:syntastic_quiet_messages = {"regex": "\\(Do not use @ in LaTeX macro names\\|Could not open.*@base\\)"}
let g:syntastic_tex_chktex_showmsgs = 0
let g:syntastic_tex_chktex_quiet_messages = {"type": "style"}

" Enable C++17 features
let g:syntastic_cpp_compiler_options = ' -std=c++17'
"let g:syntastic_cpp_config_file = '.syntastic_cpp_gcc_config'

" Disable pylint as it is too slow
let g:syntastic_python_checkers = ['python', 'pyflakes']

" show taglist
map <leader>tl :TlistToggle<CR>

" vim-latex config
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_Leader="&"

" Enable vim-pandoc-syntax on .md files
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ["cpp", "shell=sh"]
