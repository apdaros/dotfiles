" vim-plug dependencies
call plug#begin('~/.vimplugs')

Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/icalendar.vim'

" align
Plug 'godlygeek/tabular'

" nerdtree
Plug 'scrooloose/nerdtree'

" javascript & json & html
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'MaxMEllon/vim-jsx-pretty'

" complete
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

" clojure
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'Olical/conjure', {'tag': 'v4.1.0'}

" clojurescript
Plug 'vim-scripts/paredit.vim'

" flutter
Plug 'dart-lang/dart-vim-plugin'

" colors
Plug 'srcery-colors/srcery-vim'
Plug 'itchyny/lightline.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'chrisbra/Colorizer'

" linters
Plug 'w0rp/ale'
Plug 'yannickcr/eslint-plugin-react'

" utils
Plug 'junegunn/vim-easy-align'
Plug 'slim-template/vim-slim'
Plug 'luochen1990/rainbow'
Plug 'liuchengxu/vim-better-default'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'vim-scripts/tslime.vim'

call plug#end()

" removes vim-better-default relative numbers
runtime! plugin/default.vim
set norelativenumber

" load config files *.vim
runtime! config/*.vim

" colorscheme and bgs
let iterm_profile = $ITERM_PROFILE
if iterm_profile == 'Light'
  set background=light
else
  set background=dark
endif

call github_colors#togglebg_map('<f5>')

colorscheme github

set cursorline

" map leader key to ,
let mapleader=","
let maplocalleader=","

" file and buffer configs
set noswapfile
set number " show line numbers
" hide buffers instead of closing them when you :q, keeping their undo history
set hidden

" open new panes on bottom and right
set splitbelow
set splitright

" convert tabs to spaces
set expandtab
set tabstop=2
set shiftwidth=2

" enable syntax and file type detection
syntax enable
filetype plugin indent on

" enable syntax folding for blocks and comments.
set foldmethod=syntax
" don't fold blocks less than 3 lines long.
set foldminlines=3
set foldlevel=100

" indentation configuration
set cindent
set smartindent
set autoindent

" use 4 spaces for lua indentation
autocmd FileType lua setlocal shiftwidth=4 softtabstop=4 expandtab

" text search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" text search remappings
nnoremap / :set hlsearch<CR>/
nnoremap <CR> :noh<CR><CR>

" enable mouse in console
set mousemodel=extend
set mouse=a
set mousehide

" file type associations
au BufRead,BufNewFile Dockerfile* set filetype=dockerfile
au BufRead,BufNewFile .gitconfig* set filetype=gitconfig
au BufRead,BufNewFile *.ics set filetype=icalendar
au BufRead,BufNewFile *bashrc* set filetype=sh

" remove trailing whitespaces before write, except for binary files
func! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  normal `Z
endfunc
autocmd BufWrite * if ! &bin | call StripTrailingWhitespace() | endif

set wildmode=list:longest

" no hiding double quotes in JSON
let g:vim_json_syntax_conceal = 0
" fold JSONs by syntax
au BufRead,BufNewFile *.json set foldmethod=syntax

" rainbow
let g:rainbow_active = 1

" lightline
let g:lightline = { 'colorscheme': 'github' }

" ctrlp
let g:ctrlp_max_height = 20
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_switch_buffer = 2
let g:ctrlp_working_path_mode = 2
let g:ctrlp_mruf_include = '\.py$\|\.rb$|\.coffee|\.haml'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
" For some specific repository types, I want to open only files under version
" control
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.gitignore', 'cd %s && git ls-files -co -X .gitignore'],
      \ 2: ['.git/', 'cd %s && git ls-files -co'],
      \ 3: ['.hg/', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

map <leader>pp :CtrlP<CR>
map <leader>pb :CtrlPBuffer<CR>
map <leader>pt :CtrlPTag<CR>
map <leader>pq :CtrlPQuickFix<CR>
map <leader>pd :CtrlPDir<CR>
map <leader>pr :CtrlPRTS<CR>
map <leader>pm :CtrlPMRU<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" ale
let g:ale_linters = {'clojure': ['clj-kondo']}
