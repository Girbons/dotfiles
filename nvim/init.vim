set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'

" Python
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'

" Javascript
Plugin 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plugin 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

" Editor
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'



" Terminal
Plugin 'kassio/neoterm'

" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'

" YCM
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --racer-completer --tern-completer' }
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Git
Plugin 'airblade/vim-gitgutter'

" Navigation
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Disabled swap files
set noswapfile

" Enable folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" Indent
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent

"split navigations"
set splitbelow
set splitright

noremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

"Disabled arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Encoding
set encoding=utf-8

" Clipboard
set clipboard+=unnamedplus

" Mouse
set mousemodel=popup
set mouse=a

" Colors
syntax enable
set background=dark
colorscheme hybrid

let python_highlight_all=1
syntax on

" Line numbering
set nu

" NerdTREE
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autoclose = 1

" Airline
let g:airline_theme = 'hybrid'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Flake8
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" YCM
let g:ycm_python_binary_path = 'python3.5'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Clean trailing whitespace
match ErrorMsg '\s\+$'
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()

