set nocompatible " make it vim instead of vi

filetype plugin indent on " determine the filetype so indents and plugins can work

syntax enable " turn on syntax highlighting

set background=dark " dark mode
colorscheme solarized " solarized

set mouse=a " turn on the mouse

" stop wrap margins inserting hard breaks
set textwidth=0
set wrapmargin=0

" set up soft line wraps
set wrap
set linebreak
set nolist

set wildmenu " better command-line completion
set wildmode=longest:full,full " when more than one match, list all matches and complete till longest common string - for tabs afterwords, complete the next full match (cycling when you get to the last one)

set showcmd " show partial commands in the last line of the screen
set showmode " show the mode (insert, etc.) at the bottom of the screen

set incsearch " search as you type
set hlsearch " highlight searches

set ignorecase " search is case-insensitive
set smartcase " unless you explicitly use uppercase letters

set backspace=indent,eol,start " allow backspacing over autoindent, line breaks, and start of insert action

set ruler " display the cursor position

set laststatus=2 "always display the status line

set visualbell " flash instead of beep

set number " turn on line numbers
set relativenumber " turn on relative numbering

" use tabs instead of spaces
set shiftwidth=4
set tabstop=4

set list lcs=tab:\|\ " (there's intentionally a space at the end there) puts guidelines on indents

set autoindent " maintains indentation levels

set showmatch " highlight match on opposing braces

set ttyfast " vim updates in larger buffer quantities on fast terminal connections

set autoread " automatically updates file if it has been modified externally

set encoding=utf-8 " sets the file encoding

set undofile " saves undo history to a file so that you can come back to it after closing vim

" opens new split panes to the right and bottom
set splitbelow
set splitright

" remap vertical arrow keys to go up/down visual lines as opposed to numbered lines
nnoremap <Up> gk
nnoremap <Down> gj
