" # plugin configuration

" ## automatic plugin installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" utility
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" typewriter
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 8

" languages
Plug 'SidOfc/mkdx', {'for' : 'markdown'}

call plug#end()

" # backups
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set viminfo+=n~/.vim/viminfo

" # colours
colorscheme slate
let g:airline_theme='base16_default'

" # airline
let g:airline_section_x = '%y'
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L | %c'

" # cursor
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[2 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" latex
autocmd BufNewFile,BufRead *.cls, set syntax=tex

" # tabs
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" ui config
set number
filetype indent on
set wildmenu
set lazyredraw
set showmatch

" searching
set incsearch
set hlsearch

" folding
set foldenable
set foldlevelstart=8
set foldnestmax=8
set foldmethod=indent

" split
set splitbelow
set splitright

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" backspace
set backspace=indent,eol,start
