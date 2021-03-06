" be iMproved, requred (for cool vim things, apparently)
set nocompatible

" vim-plug
" Plugins for vim
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-fugitive' " Git wrapper for vim
  Plug 'scrooloose/nerdcommenter' " Toggleable comments
  Plug 'ctrlpvim/ctrlp.vim' " Another fuzzy file finder
  Plug 'vim-airline/vim-airline' " A cool bar at the bottom
  Plug 'vim-airline/vim-airline-themes' " A cool bar with themes at the bottom
  Plug 'valloric/youcompleteme' " Autocompletion and suggestions
  Plug 'mattn/emmet-vim'
  Plug 'airblade/vim-gitgutter' " Git in the gutter
  Plug 'alvan/vim-closetag' " Auto-close tags
  Plug 'alampros/vim-styled-jsx' " Styled-jsx Syntax
  Plug 'elzr/vim-json' " JSON Syntax
  Plug 'jiangmiao/auto-pairs' " Autocomplete quotes, brackets etc.
  Plug 'terryma/vim-multiple-cursors'
  Plug 'sonph/onehalf', {'rtp': 'vim/'} " Onehalf theme
  Plug 'sheerun/vim-polyglot'
  Plug 'w0rp/ale' " Linting
  Plug 'scrooloose/nerdtree' " file explorer sidebar
  " Following (until snipmate) is for snipmate
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate' " Snippets in vim
  Plug 'honza/vim-snippets' " Snippets collection
  " (Optional) Multi-entry selection UI.
  Plug 'junegunn/fzf'
call plug#end()

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

" Stop vim-json from hiding quotes
let g:vim_json_syntax_conceal = 0

" Mapleader
let mapleader = ','
let loaded_matchparen = 1

" Move around splits with cmd + direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <esc><esc> :silent! nohls<cr>
" Move by screen line instead of file line
nnoremap j gj
nnoremap k gk
" Pressing semicolon in normal mode will automatically assume colon for commands
nnoremap ; :
" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Toggle NERDTree with ,n
map <leader>n :NERDTreeToggle<CR>
" Key mapping
map! <D-Right> $
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <C-Left> :tabprev
map <C-Right> :tabnext

" filetype specific plugin/indent
filetype plugin indent on

set viminfo="~/.vim/cache/.viminfo"
" Set history limit
set history=500
" Autoread changes from files changes outside of vim
set autoread
" Changes the default backspace behaviour in some implementations of vim
set backspace=indent,eol,start
" Control new split directions
set splitbelow
set splitright
" Ignore compiled files
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
" command line completion
set wildmenu
" Tabsize
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
" Auto indent
set breakindent
" Nicer linebreaks
set display+=lastline
set lbr
" Text width
set tw=500
" Something to do with indenting (stole from other people)
set ai
set si
set wrap
" Stop vim from concealing text
set conceallevel=0
" Help vims buffer retain things (apparently)
set hidden
" Sets the title automatically
set title
" no backup files created
set nobackup
set noswapfile
set hlsearch
set noerrorbells
set copyindent
set smartindent
set autoindent
set incsearch
set ignorecase

" start: automatically trim trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,js,less,styl,html,css autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Keep undo history across sessions, by storing in file.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 1 " Add autocomplete opts to the preview
let g:ycm_autoclose_preview_window_after_insertion = 1 " But close the preview when it's done

" Ctrl+P ignores
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" UI
" Tell vim when to start scrolling. In this case, 7 lines from the bottom.
set so=7
" show hidden characters (tabs, trailing spaces) with a specified character
set list
set listchars=tab:▸\ ,trail:▫
" Line numbers
set number
set cursorline
" Syntax Highlighting
syntax enable
colorscheme onehalflight
" Customise theme to work well with terminal
highlight Normal ctermbg=NONE
highlight Comment ctermfg=grey
highlight CursorLine cterm=none ctermbg=255 ctermfg=none
highlight CursorLineNR ctermfg=69 ctermbg=255
highlight LineNR ctermfg=grey ctermbg=none
highlight MatchParen ctermfg=darkred ctermbg=grey
highlight Pmenu ctermfg=white ctermbg=darkgrey
highlight PmenuSel ctermfg=white ctermbg=darkmagenta
highlight NonText ctermfg=darkgrey ctermbg=none
highlight SpecialKey ctermfg=darkgrey
highlight Number ctermbg=none ctermfg=69

" Airline settings
set laststatus=2
let g:airline_theme='onehalfdark'


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ''

" Don't limit JSX highlighting to files with .jsx filetype
let g:jsx_ext_required = 0

" filenames for vim-closetag to autoclose HTML tags (including jsx in .js files)
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" Allow creation of dirs on write
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

" NERDTree Config
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.swp$', '\.DS_Store', '\.git\/']
let NERDTreeSortOrder = ['\/$', '^\.']

" Ctrl-P settings
" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Custom stuff from p2pnodeweb
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif

