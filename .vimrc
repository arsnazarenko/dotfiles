set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set showmatch
set noswapfile
set nobackup
set nosplitbelow
set splitright
set wrap linebreak nolist
set scrolloff=8
set fileencoding=utf-8
set termguicolors
set mouse=a


syntax enable
set cursorline
set hidden
set number relativenumber
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

" Colors
set t_Co=256

" The same parameter without graphics server
if !has('gui_running')
    set t_Co=256
endif

" Colors in terminal
if has('termguicolors')
    set termguicolors
endif

"Colors in allacritty
if &term == 'alacritty'
    let &term='xterm-256color'
endif

set background=dark
