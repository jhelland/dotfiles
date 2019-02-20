set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
"set t_Co=256
"set autowrite
set backspace=indent,eol,start

" visual appearance
syntax on
set number
set relativenumber
set nowrap
set lazyredraw  " makes things faster

" status line
set statusline=%F  " full path to file
set statusline+=%(\ [%M%R]%)  " modified and readonly flags

" matching brace
set showmatch

" shorcuts
vnoremap <C-c> "*y
vnoremap <C-p> "*p
map <Up> <nop>
map <Left> <nop>
map <Right> <nop>
map <Down> <nop>
imap jj <Esc>

let g:indent_guides_enable_on_vim_startup = 1  " indent guides plugin on startup
set ts=2 sw=2 et  " tab spacing
let g:indent_guides_start_level=2
let g:intend_guides_guide_size=1

" file-type specific settings
autocmd FileType markdown setlocal spell spelllang=en_us

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" C/C++ setup
Plugin 'SirVer/ultisnips'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'tpope/vim-obsession'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'gikmx/ctrlp-obsession'
Plugin 'dhruvasagar/vim-prosession'

" python
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'vim-syntastic/syntastic'

" tree-based file hierarchy view
Plugin 'scrooloose/nerdtree'

" color scheme
Plugin 'morhetz/gruvbox'

" latex
Plugin 'vim-latex/vim-latex'

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
" Put your non-Pluglet g:UltiSnipsExpandTrigger="<CAPS>"

" filtype specific
let g:tex_flavor="latex"

" set make program (rubber)
"autocmd FileType tex set makeprg=rubber\ --inplace\ --maxerr\ 1\ \ --pdf\ --short\ --quiet\ --force\% 
" mapping for compiling latex file
autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
autocmd FileType tex nmap <buffer> T :!open -a Skim %<.pdf %<.pdf<CR><CR>
"autocmd FileType tex nmap <buffer> C :!rubber --clean<CR>
autocmd FileType tex nmap <buffer> C :!latexmk -c %<CR><CR>

" skeleton files
autocmd! BufNewFile * silent! 0r ~/.vim/skel/template.%:e

let python_highlight_all=1

let g:ctrlp_working_path_mode=0

colorscheme gruvbox


