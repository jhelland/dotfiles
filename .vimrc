set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
syntax on
set t_Co=256
set autowrite
set number
set relativenumber

vnoremap <C-c> "*y
vnoremap <C-p> "*p
map <Up> <nop>
map <Left> <nop>
map <Right> <nop>
map <Down> <nop>

let g:indent_guides_enable_on_vim_startup = 1  " indent guides plugin on startup
set ts=2 sw=2 et  " tab spacing
let g:indent_guides_start_level=2
let g:intend_guides_guide_size=1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-lexical'
Plugin 'reedes/vim-wordy'
Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-textobj-quote'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'dbmrq/vim-ditto'
Plugin 'vim-scripts/LanguageTool'
Plugin 'kana/vim-textobj-user'
Plugin 'powerline/powerline'
Plugin 'nathanaelkane/vim-indent-guides'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo


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

" Custom {{{
function! Prose()
	" custom color scheme
	colo pencil

	setlocal spell
	setlocal guifont=Monospace\ 12 

	" initialize writing plugins
	call pencil#init({'wrap': 'soft', 'autoformat': 1})
	call lexical#init()
	call litecorrect#init()
	
	" manual reformatting shortcuts
	nnoremap \s ea<C-X><C-S>
	nnoremap <buffer><silent> Q gqap
	xnoremap <buffer><silent> Q gq
	nnoremap <buffer><silent><leader>Q vapJgqap
endfunction

" automatically initialize buffer by file type
autocmd FileType markdown,mkd,text,doc call Prose()

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()

let g:languagetool_jar='$HOME/Documents/writing/LanguageTool-3.8/languagetool-commandline.jar'


