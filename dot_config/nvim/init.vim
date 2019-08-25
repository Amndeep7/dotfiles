" enable mouse
set mouse=a

" search is case insensitive unless you use uppercase letters
set ignorecase
set smartcase

" relative line numbers but the number for the line you're on is absolute
set number
set relativenumber

" guidelines on indents
set list

" briefly highlights matching brace
set showmatch

" save undo history between sessions
set undofile

" opens new split panes to the bottom and to the right
set splitbelow
set splitright

" use the system clipboard
set clipboard=unnamed

" remap up and down to go by visual lines as opposed to numbered lines
nnoremap <Up> gk
nnoremap <Down> gj<Paste>

" plugins
call plug#begin()
" manage plug with plug
Plug 'junegunn/vim-plug'

" solarized color scheme
Plug 'altercation/vim-colors-solarized'

" javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & npm install' }

" python
Plug 'numirias/semshi', { 'for': 'python', 'do': ':UpdateRemotePlugins' }

call plug#end()

" plugin configuration
" solarized
colorscheme solarized
