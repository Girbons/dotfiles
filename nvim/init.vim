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
Plugin 'qpkorr/vim-bufkill'

" Python
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'

" Fugggitivo
Plugin 'tpope/vim-fugitive'

" Go
Plugin 'fatih/vim-go'

" Rust
Plugin 'rust-lang/rust.vim'

" Javascript
Plugin 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plugin 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plugin 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Editor
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'

" BO
Plugin 'itchyny/lightline.vim'

" YML
Plugin 'stephpy/vim-yaml'

" Ansible
Plugin 'pearofducks/ansible-vim'

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

" Commenter
Plugin 'scrooloose/nerdcommenter'

" Git
Plugin 'airblade/vim-gitgutter'

" Navigation
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Docker
Plugin 'ekalinin/Dockerfile.vim'

" Font
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Markdown
Plugin 'JamshedVesuna/vim-markdown-preview'

" black python formatter
Plugin 'ambv/black'

" <3
Plugin 'Psykopear/neovim-package-info', { 'do': './install.sh' }


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" remap leader
let mapleader = ","

" Line numbering
set nu

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

" Clipboard
set clipboard+=unnamedplus

" Mouse
set mousemodel=popup
set mouse=a

" Colors
set termguicolors
set background=dark
syntax enable
colorscheme gruvbox

let python_highlight_all=1
syntax on

" Python breakpoints
au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>B g/^.*import ipdb; ipdb.set_trace().*/d

" Rust
let g:rust_clip_command = 'pbcopy'

" Javascript tabsssss
autocmd FileType javascript setlocal ts=2 sw=2

" fzf
set rtp+=/usr/local/opt/fzf

" vim-go
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" NerdTREE
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

map <C-n> :NERDTreeToggle<CR>

" Devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
"let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autoclose = 1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ }

" Flake8
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

let g:python_host_prog="/usr/local/bin/python2/"
let g:python3_host_prog="/Library/Frameworks/Python.framework/Versions/3.6/bin/python3"

let s:go =  "b2ffff"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['go'] = s:go " sets the color of css files to blue

let g:go_fmt_command = "goimports"

" markdown
let vim_markdown_preview_github=1

" Clean trailing whitespace
match ErrorMsg '\s\+$'
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()

if !has('gui_running')
  set t_Co=256
endif
