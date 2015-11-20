set nocompatible              " be iMproved, required
filetype on                  " required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'https://github.com/gregsexton/MatchTag.git'
Plugin 'https://github.com/alvan/vim-closetag.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/elzr/vim-json'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file://~/.vim/bundle/vim-sensible'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" enable syntax highlighting
" syntax on

set ignorecase
set smartcase
" set backspace to work like most apps
 set backspace=2

 " enhance cli completion
 set wildmenu

 " turn on ruler
 set ruler

 " highlight current line
 set cursorline

 " turn on auto indentation
 set autoindent

 " allow use of mouse
 set mouse=a

 " disable backups
 set nobackup

 " add line numbers
 set number

 " always display status (useful for vim-airline)
 set laststatus=2

 " hide abandoned buffers
 set hid

 " show matching brackets
 set showmatch
 set mat=2

 " highlight search results
 set hlsearch

 " trim trailing whitespace
 autocmd BufWritePre * :%s/\s\+$//e

 " theme settings
 set background=light
 colorscheme monokai
 set t_Co=256

 ""
 " INDENTATION
 ""

 " use tabs, indent two (not four)
 set noexpandtab
 set tabstop=2
 set shiftwidth=2
 set smarttab

 ""
 " FOLDING
 ""

 " fold by indentation
 set foldmethod=indent

 " set deepest fold to 10 levels
 set foldnestmax=10

 " don't fold code by default
 set nofoldenable

 " set fold level to 1
 set foldlevel=1

 ""
 " PLUGIN SETTINGS
 ""

 " MULTIPLE SELECTION
 " use ctrl+v to select next match (similar to Sublime's CMD+D)
 let g:multi_cursor_next_key='<C-v>'

 " EMMET
 " expand items with tab
 imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

 " go to next edit with ctrl+n
 let g:user_emmet_next_key='<C-n>'
 let g:vim_json_syntax_conceal = 1
 let g:vim_json_warnings=1
 let g:closttag_filenames = "*.html,*.xhtml,*.phtml,*.css"

 " Set no max file limit
  let g:ctrlp_max_files = 0
  " Search from current directory instead of project root
  let g:ctrlp_working_path_mode = 0

