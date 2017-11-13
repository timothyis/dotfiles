" be iMproved, requred (for cool vim things, apparently)
set nocompatible

" vim-plug
" Plugins for vim
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-fugitive' " Git wrapper for vim
  Plug 'scrooloose/nerdcommenter' " Toggleable comments
  Plug 'wincent/command-t' "Fuzzy file finder
  Plug 'ctrlpvim/ctrlp.vim' " Another fuzzy file finder
  Plug 'vim-airline/vim-airline' " A cool bar at the bottom
  Plug 'vim-airline/vim-airline-themes' " A cool bar with themes at the bottom
  Plug 'valloric/youcompleteme' " Autocompletion and suggestions
  Plug 'mattn/emmet-vim'
  Plug 'airblade/vim-gitgutter' " Git in the gutter
  Plug 'alvan/vim-closetag' " Auto-close tags
  Plug 'pangloss/vim-javascript' " JS Syntax
  Plug 'elzr/vim-json' " JSON Syntax
  Plug 'digitaltoad/vim-pug' " Pug Syntax
  Plug 'Raimondi/delimitMate' "Autocomplete quotes etc.
  Plug 'terryma/vim-multiple-cursors'
  Plug 'yuttie/hydrangea-vim' " Hydrangea theme
  Plug 'w0rp/ale' " Linting
call plug#end()

" Stop vim-json from hiding quotes
let g:vim_json_syntax_conceal = 0

" Set history limit
set history=500
" Autoread changes from files changes outside of vim
set autoread
" Changes the default backspace behaviour in some implementations of vim
set backspace=indent,eol,start

" Mapleader
let mapleader = ','

" Move around splits with cmd + direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Move by screen line instead of file line
nnoremap j gj
nnoremap k gk
" Pressing semicolon in normal mode will automatically assume colon for commands
nnoremap ; :
" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" filetype specific plugin/indent
filetype plugin indent on

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

" Keep undo history across sessions, by storing in file.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Key mapping
map! <D-Right> $
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap j gj
nnoremap k gk


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
colorscheme hydrangea
" Customise theme to work well with terminal
highlight Normal ctermbg=NONE
highlight Comment ctermfg=grey
highlight CursorLine cterm=none ctermbg=none ctermfg=none
highlight CursorLineNR ctermfg=48 ctermbg=none
highlight LineNR ctermfg=grey ctermbg=none
highlight MatchParen ctermfg=darkred ctermbg=grey
highlight Pmenu ctermfg=white ctermbg=darkgrey
highlight PmenuSel ctermfg=white ctermbg=darkmagenta
highlight NonText ctermfg=darkgrey ctermbg=none
highlight SpecialKey ctermfg=darkgrey
highlight Number ctermbg=none ctermfg=44
highlight Constant ctermbg=none

" Airline settings
set laststatus=2
let g:airline_theme='deus'


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ''

" Delimitmate will expand and add a carriage return to brackets
let delimitMate_expand_cr = 1
