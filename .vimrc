set nocompatible " make it vim instead of vi
filetype off " vundle wants it off

set rtp+=~/.vim/bundle/Vundle.vim " put Vundle on the runtime path
call vundle#begin() " init vundle

Plugin 'VundleVim/Vundle.vim' " have Vundle manage Vundle

Plugin 'altercation/vim-colors-solarized' " solarized for Vim

Plugin 'sjl/gundo.vim' " Gundo - lets you view the undo tree (not stack which is what every other editor uses

Plugin 'Valloric/YouCompleteMe' " code-completion engine

Plugin 'rdnetto/YCM-Generator' " generates .ycm_extra_conf.py files for c/cpp projects for use with YCM

Plugin 'kana/vim-smartinput' " auto-completes braces/quotes

Plugin 'terryma/vim-multiple-cursors' " sublime text style multiple cursors

Plugin 'Shougo/vimproc.vim' " Asynchronous execution library for vim

Plugin 'Shougo/unite.vim' " search and display information from arbitrary sources such as files and buffers

Plugin 'Shougo/neomru.vim' " adds accessibility to most recently updated? files to vim/unite

Plugin 'pangloss/vim-javascript' " adds better js syntax highlighting and indentation

Plugin 'vim-scripts/indentpython.vim' " adds better python indentation

Plugin 'scrooloose/syntastic' " syntax checker for many languages

Plugin 'nvie/vim-flake8' " syntax/style checker for python

Plugin 'rust-lang/rust.vim' " file detection, syntax highlighting, formatting, syntastic integration, etc. for rust

Plugin 'cespare/vim-toml' " syntax for TOML

Plugin 'godlygeek/tabular' " aligns things along tabs and stuff - dependency for plasticboy/vim-markdown

Plugin 'plasticboy/vim-markdown' " syntax highlighting, matching rules, and mappings for Markdown and extensions

Plugin 'exu/pgsql.vim' " better syntax highlighting for sql, in particular the postgres variant

call vundle#end() " mark the end of all the plugins that Vundle will manage

filetype plugin indent on " determine the filetype so indents and plugins can work

syntax enable " turn on syntax highlighting

" turn on solarized dark
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" set up syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_javascript_checkers = ['eslint']

let python_highlight_all = 1 " make python look prettier

let g:gundo_prefer_python3 = 1 " make gundo use python3

let g:ycm_confirm_extra_conf = 0 " make ycm stop prompting if it's found a more local version of ycm_extra_conf
let g:ycm_autoclose_preview_window_after_completion = 1 " make the preview box at the top of the screen go away when I choose an autocomplete option
let g:ycm_python_binary_path = 'python3' " set the binary of python for ycm to complete for
let g:ycm_rust_src_path = expand('~/rustc-1.11.0/src') " allows ycm to find the source for rust so that it can have intelligent autocomplete

let g:javascript_enable_domhtmlcss = 1 " enable html/css syntax highlighting as well from vim-javascript

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

let mapleader="," " leader is now the comma as opposed to the \ (backslash)

" remap ctrl+movement keys to navigate splits
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" remap vertical arrow keys to go up/down visual lines as opposed to numbered lines
nnoremap <Up> gk
nnoremap <Down> gj

" display undo tree
nnoremap <leader>u :<C-u>GundoToggle<cr>

" unite
" fuzzy file matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" the higher the matched word is or the logner the matched length is, the
" higher the rank is in the sorted list
call unite#filters#sorter_default#use(['sorter_rank'])
" where it stores data
let g:unite_data_directory='~/.vim/.cache/unite'
" buffer and recursive file search
nnoremap <leader>q :<C-u>Unite -start-insert -auto-preview buffer file_rec/async<cr>
if executable('ag')
	" use ag for recursive file search as opposed to find
	let g:unite_source_rec_async_command=['ag', '-S', '--follow', '--vimgrep', '--hidden', '-g', '']
	" use ag for in-file search as opposed to grep 
	let g:unite_source_grep_command='ag'
	let g:unite_source_grep_default_opts='-S --follow --vimgrep --hidden'
	let g:unite_source_grep_recursive_opt=''
endif
" grep->ag search
nnoremap <leader>w :<C-u>Unite -auto-preview grep:.<cr>
" buffer switching
nnoremap <leader>e :<C-u>Unite -auto-preview -quick-match buffer<cr>
" split in insert mode
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	" Overwrite settings.
	imap <silent><buffer><expr> <C-c> unite#do_action('split')
	imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
endfunction
